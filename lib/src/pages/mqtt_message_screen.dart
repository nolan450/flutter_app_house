import 'package:flutter/material.dart';
import 'package:flutter_app_house/my_mqtt.dart';
import 'package:mqtt_client/mqtt_client.dart';
  
class MqttMessageScreen extends StatefulWidget {
  const MqttMessageScreen({Key? key}) : super(key: key);

  @override
  _MqttMessageScreenState createState() => _MqttMessageScreenState();
}

class _MqttMessageScreenState extends State<MqttMessageScreen> {
  final MyMqtt myMqtt = MyMqtt();
  String message = "Aucun message reçu pour le moment";
  bool isConnected = false;
   List<String> messages = [];

  @override
  void initState() {
    super.initState();
    // Initialiser MQTT et écouter les messages
    myMqtt.test();

    // Écouter les mises à jour des messages
    myMqtt.client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt = MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      // Mettre à jour l'UI avec le message reçu
      setState(() {
        messages.add("Topic: ${c[0].topic}\nMessage: $pt");
      });
    });

    // Écouter l'état de la connexion
    myMqtt.client.onConnected = () {
      setState(() {
        isConnected = true;
      });
    };
    myMqtt.client.onDisconnected = () {
      setState(() {
        isConnected = false;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Messages MQTT"),
        actions: [
          Icon(
            isConnected ? Icons.check_circle : Icons.cancel,
            color: isConnected ? Colors.green : Colors.red,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: messages.isEmpty
            ? const Center(
                child: Text(
                  "Aucun message reçu pour le moment",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              )
            : ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        messages[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action pour rafraîchir ou réinitialiser les messages
          setState(() {
            messages.clear();
          });
        },
        child: const Icon(Icons.refresh),
        tooltip: "Effacer les messages",
      ),
    );
  }
}