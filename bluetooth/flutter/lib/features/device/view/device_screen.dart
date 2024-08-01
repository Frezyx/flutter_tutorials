import 'package:esp_ble_flutter/features/device/bloc/device_bloc.dart';
import 'package:esp_ble_flutter/features/device/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({
    super.key,
    required this.device,
  });

  final BluetoothDevice device;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceBloc(
        device: device,
        serviceUuid: '4fafc201-1fb5-459e-8fcc-c5c9c331914b',
        characteristicUuid: 'beb5483e-36e1-4688-b7f5-ea07361b26a8',
      ),
      child: Scaffold(
        body: BlocBuilder<DeviceBloc, DeviceState>(
          builder: (context, state) {
            if (state is! DeviceLoaded) {
              return const Center(child: CircularProgressIndicator());
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorSlider(
                    color: Colors.red,
                    value: state.red.toDouble(),
                    onChanged: (value) => _setRedValue(value, context),
                  ),
                  ColorSlider(
                    color: Colors.green,
                    value: state.green.toDouble(),
                    onChanged: (value) => _setGreenValue(value, context),
                  ),
                  ColorSlider(
                    color: Colors.blue,
                    value: state.blue.toDouble(),
                    onChanged: (value) => _setBlueValue(value, context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _setBlueValue(double value, BuildContext context) {
    context.read<DeviceBloc>().add(
          UpdateDeviceCharacteristics(
            blue: value.toInt(),
          ),
        );
  }

  void _setGreenValue(double value, BuildContext context) {
    context.read<DeviceBloc>().add(
          UpdateDeviceCharacteristics(
            green: value.toInt(),
          ),
        );
  }

  void _setRedValue(double value, BuildContext context) {
    context.read<DeviceBloc>().add(
          UpdateDeviceCharacteristics(
            red: value.toInt(),
          ),
        );
  }
}
