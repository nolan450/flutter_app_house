import 'package:flutter/material.dart';

class ControlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              // Action pour ouvrir les fenêtres : log de l'action
              print('Ouverture des fenêtres');
            },
            child: const Text('Ouvrir les fenêtres'),
          ),
          ElevatedButton(
            onPressed: () {
              // Action pour fermer les fenêtres
              print('Fermeture des fenêtres');
            },
            child: const Text('Fermer les fenêtres'),
          ),
          ElevatedButton(
            onPressed: () {
              // Action pour changer la couleur de la LED
              print('Changement de la couleur de la LED');
            },
            child: const Text('Changer la couleur de la LED'),
          ),
        ],
      ),
    );
  }
}
