import 'package:flutter/material.dart';
import 'package:flutter_app_house/src/models/settings.dart';

class SecondaryTitle extends StatelessWidget{
  const SecondaryTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Settings.defaultPadding),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: Settings.secondaryTitleFontSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}