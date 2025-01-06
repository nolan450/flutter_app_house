import 'package:flutter/material.dart';
import 'package:flutter_app_house/src/pages/alerts_page.dart';
import 'package:flutter_app_house/src/pages/control_page.dart';
import 'package:flutter_app_house/src/pages/dashboard_page.dart';
import 'package:flutter_app_house/src/pages/mqtt_message_screen.dart';
import 'package:flutter_app_house/src/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardPage(), // Page pour le monitoring
    ControlPage(),   // Page pour le contrôle
    const MqttMessageScreen(),
    //AlertsPage(),    // Page pour les alertes
    SettingsPage(),  // Page pour les paramètres
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maison Connectée'),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_remote),
            label: 'Contrôle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning),
            label: 'Alertes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}