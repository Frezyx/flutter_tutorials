import 'package:esp_ble_flutter/features/device/device.dart';
import 'package:esp_ble_flutter/features/devices/bloc/devices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DevicesListScreen extends StatelessWidget {
  const DevicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DevicesBloc>(
      create: (context) => DevicesBloc()..add(LoadDevices()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Список девайсов'),
        ),
        body: BlocBuilder<DevicesBloc, DevicesState>(
          builder: (context, state) {
            if (state is! DevicesLoaded) {
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.separated(
              itemCount: state.devices.length,
              itemBuilder: (context, index) {
                final device = state.devices[index];
                return ListTile(
                  title: Text(device.advName),
                  subtitle: Text(device.platformName),
                  onTap: () => _openDeviceScreen(context, device),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _enableFlutterBle,
        //   child: const Icon(Icons.refresh),
        // ),
      ),
    );
  }

  void _openDeviceScreen(BuildContext context, BluetoothDevice device) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DeviceScreen(device: device),
      ),
    );
  }
}
