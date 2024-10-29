import 'package:flutter/material.dart';

class SliderLevelFan extends StatefulWidget {
  const SliderLevelFan({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<double> onChanged;

  @override
  State<SliderLevelFan> createState() => _SliderLevelFanState();
}

class _SliderLevelFanState extends State<SliderLevelFan> {
  double _currentSliderValue = 0; // État interne

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _currentSliderValue,
          max: 1000000,
          divisions: 10,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            widget.onChanged(value); // Transmet la nouvelle valeur
          },
        ),
        Text(
          'Valeur actuelle: ${_currentSliderValue.round()}',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}