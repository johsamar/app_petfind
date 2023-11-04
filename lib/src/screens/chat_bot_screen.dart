import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  List<String> chatMessages = []; // Lista de mensajes en el chat
  TextEditingController messageController =
      TextEditingController(); // Controlador del campo de entrada de mensajes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petbot - Asistente'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatMessages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(hintText: 'Escribe un mensaje'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    _handleMessage(messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleMessage(String message) {
    setState(() {
      chatMessages.add('Usuario: $message');
      // Lógica del chatbot: Aquí puedes procesar el mensaje del usuario y obtener la respuesta del chatbot
      String response = getChatBotResponse(message);
      chatMessages.add('Petbot: $response');
      messageController.clear(); // Limpiar el campo de entrada
    });
  }

  // Implementa la lógica del chatbot aquí (por ejemplo, una respuesta simple).
  String getChatBotResponse(String message) {
    if (message.toLowerCase().contains('hola')) {
      return '¡Hola! ¿En qué puedo ayudarte?';
    } else {
      return 'Lo siento, no entiendo tu mensaje.';
    }
  }
}
