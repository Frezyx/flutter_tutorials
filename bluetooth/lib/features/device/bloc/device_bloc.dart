import 'dart:async';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc({
    required BluetoothDevice device,
    required this.serviceUuid,
    required this.characteristicUuid,
  })  : _device = device,
        super(DeviceInitial()) {
    on<UpdateDeviceCharacteristics>(_updateCharacteristics);
    _deviceSub = _device.connectionState.listen((state) {
      if (state == BluetoothConnectionState.disconnected) {
        _connectAndRread();
      }
    });
  }

  final String serviceUuid;
  final String characteristicUuid;

  final BluetoothDevice _device;

  BluetoothCharacteristic? _characteristic;
  StreamSubscription<BluetoothConnectionState>? _deviceSub;

  void _updateCharacteristics(
    UpdateDeviceCharacteristics event,
    Emitter<DeviceState> emit,
  ) {
    final prevState =
        state is DeviceLoaded ? state as DeviceLoaded : DeviceLoaded();
    emit(
      prevState.copyWith(
        red: event.red,
        green: event.green,
        blue: event.blue,
      ),
    );
    if (event is! _SetInitialDeviceCharacteristics) {
      _writeCharacteristics();
    }
  }

  Future<void> _connectAndRread() async {
    await _device.connect();
    final services = await _device.discoverServices();
    log(services.toString());

    final serviceExist =
        services.where((e) => e.serviceUuid.str == serviceUuid).isNotEmpty;
    if (!serviceExist) return;

    final service =
        services.firstWhere((e) => e.serviceUuid.str == serviceUuid);

    final characteristics = service.characteristics;

    final characteristicExist = characteristics
        .where((e) => e.characteristicUuid.str == characteristicUuid)
        .isNotEmpty;
    if (!characteristicExist) return;

    final characteristic = characteristics
        .firstWhere((e) => e.characteristicUuid.str == characteristicUuid);
    _characteristic = characteristic;

    final value = await characteristic.read();
    if (value.length != 3) return;

    final redValue = value[0];
    final greenValue = value[1];
    final blueValue = value[2];

    add(
      _SetInitialDeviceCharacteristics(
        red: redValue,
        green: greenValue,
        blue: blueValue,
      ),
    );
  }

  void _writeCharacteristics() {
    final prevState = state;
    if (prevState is! DeviceLoaded) return;

    final characteristic = _characteristic;
    if (characteristic != null) {
      characteristic.write(
        [
          prevState.red,
          prevState.green,
          prevState.blue,
        ],
      );
    }
  }

  @override
  Future<void> close() async {
    await _deviceSub?.cancel();
    return super.close();
  }
}
