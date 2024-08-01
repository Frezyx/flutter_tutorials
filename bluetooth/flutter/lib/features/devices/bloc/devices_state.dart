part of 'devices_bloc.dart';

sealed class DevicesState extends Equatable {}

final class DevicesInitial extends DevicesState {
  @override
  List<Object?> get props => [];
}

final class DevicesLoading extends DevicesState {
  @override
  List<Object?> get props => [];
}

final class DevicesLoaded extends DevicesState {
  DevicesLoaded({required this.devices});

  final List<BluetoothDevice> devices;

  @override
  List<Object?> get props => [devices];
}

final class DevicesFailure extends DevicesState {
  DevicesFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
