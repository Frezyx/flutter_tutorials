part of 'device_bloc.dart';

sealed class DeviceEvent extends Equatable {}

final class UpdateDeviceCharacteristics extends DeviceEvent {
  UpdateDeviceCharacteristics({
    this.red,
    this.green,
    this.blue,
  });

  final int? red;
  final int? green;
  final int? blue;

  @override
  List<Object?> get props => [red, green, blue];
}

final class _SetInitialDeviceCharacteristics
    extends UpdateDeviceCharacteristics {
  _SetInitialDeviceCharacteristics({
    super.red,
    super.green,
    super.blue,
  });
}
