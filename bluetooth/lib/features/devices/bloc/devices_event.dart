part of 'devices_bloc.dart';

sealed class DevicesEvent extends Equatable {}

final class LoadDevices extends DevicesEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class _SetLoadedDevices extends DevicesEvent {
  _SetLoadedDevices(this.devices);
  final List<BluetoothDevice> devices;

  @override
  List<Object?> get props => [devices];
}
