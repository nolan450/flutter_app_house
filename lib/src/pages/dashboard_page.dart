import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Température : 22°C'),
          Text('Humidité : 60%'),
          Text('Gaz détecté : Non'),
          Text('Mouvement détecté : Non'),
        ],
      ),
    );
  }
}
