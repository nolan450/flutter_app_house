import 'package:flutter/material.dart';
import 'package:flutter_app_house/src/models/settings.dart';

class MainTitle extends StatelessWidget{
  const MainTitle({super.key, required this.title});

  final String title;

  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Settings.defaultPadding),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: Settings.mainTitleFontSize,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      )
    );
  }
}