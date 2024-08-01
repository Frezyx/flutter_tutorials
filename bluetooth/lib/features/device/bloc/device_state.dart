part of 'device_bloc.dart';

sealed class DeviceState extends Equatable {}

final class DeviceInitial extends DeviceState {
  @override
  List<Object?> get props => [];
}

final class DeviceLoading extends DeviceState {
  @override
  List<Object?> get props => [];
}

final class DeviceLoaded extends DeviceState {
  DeviceLoaded({
    this.red = 0,
    this.green = 0,
    this.blue = 0,
  });

  final int red;
  final int green;
  final int blue;

  @override
  List<Object?> get props => [red, green, blue];

  DeviceLoaded copyWith({
    int? red,
    int? green,
    int? blue,
  }) {
    return DeviceLoaded(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }
}

final class DeviceFailure extends DeviceState {
  DeviceFailure(this.exception);

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
