import 'package:flutter/material.dart';


class Sliderlevelbutton extends StatefulWidget {
  const Sliderlevelbutton({super.key, required this.onChanged});

  final ValueChanged onChanged;

  @override
  State<Sliderlevelbutton> createState() => _SliderlevelbuttonState();
}

class _SliderlevelbuttonState extends State<Sliderlevelbutton> {
  final double _currentSliderValue = 0;

  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(value: _currentSliderValue, 
      max: 1000000,
      divisions: 10,
      label: _currentSliderValue.round().toString(),
      onChanged: (double value) {
        widget.onChanged(value);
      }),
      Text(
        'Valeur actuelle: ${_currentSliderValue.round()}',
        style: Theme.of(context).textTheme.headlineSmall,
      )
      ],
    );
  }
}