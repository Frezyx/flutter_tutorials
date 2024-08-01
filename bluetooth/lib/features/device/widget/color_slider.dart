import 'package:esp_ble_flutter/features/device/widget/widget.dart';
import 'package:flutter/material.dart';

class ColorSlider extends StatelessWidget {
  const ColorSlider({
    super.key,
    required this.color,
    required this.value,
    required this.onChanged,
  });

  final Color color;
  final double value;
  final Function(double value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorBox(color: color),
        Slider(
          value: value,
          max: 255,
          min: 0,
          divisions: 255,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
