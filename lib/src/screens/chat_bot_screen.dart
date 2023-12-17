import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  TextEditingController _messageController = TextEditingController();
  List<ChatMessage> _chatMessages = [];

  @override
  void initState() {
    super.initState();
    _addBotMessage(
        "Hola, soy Petbot, tu asistente virtual para mascotas. ¿En qué puedo ayudarte? (Escribe 'registrar mascota', 'reportar pérdida' o 'reportar avistamiento')");
  }

  void _addBotMessage(String text) {
    _chatMessages.add(ChatMessage(
      text: text,
      isBot: true,
    ));
  }

  void _addUserMessage(String text) {
    _chatMessages.add(ChatMessage(
      text: text,
      isBot: false,
    ));
  }

  void _handleUserMessage(String message) {
    _addUserMessage(message);

    // Lógica para manejar las opciones del usuario
    if (message.toLowerCase().contains("registrar mascota")) {
      _addBotMessage("¡Perfecto! Ve a la pantalla de registro de mascotas.");
      // Navegar a la pantalla de registro de mascotas
      Navigator.pushReplacementNamed(context, '/register_pet');
    } else if (message.toLowerCase().contains("reportar perdida")) {
      _addBotMessage(
          "Lo siento por eso. Por favor, ve a la pantalla de reporte de pérdida.");
      // Navegar a la pantalla de reporte de pérdida
      Navigator.pushReplacementNamed(context, '/report');
    } else if (message.toLowerCase().contains("reportar avistamiento")) {
      _addBotMessage(
          "¡Genial! Dirígete a la pantalla de reporte de avistamiento.");
      // Navegar a la pantalla de reporte de avistamiento
      Navigator.pushReplacementNamed(context, '/report');
    } else {
      _addBotMessage("Lo siento, no entendí. ¿Puedes reformular tu solicitud?");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Petbot - Asistente'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final message = _chatMessages[index];
                return ChatBubble(
                  text: message.text,
                  isBot: message.isBot,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String userMessage = _messageController.text.trim();
                    if (userMessage.isNotEmpty) {
                      _handleUserMessage(userMessage);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isBot;

  ChatMessage({
    required this.text,
    required this.isBot,
  });
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isBot;

  ChatBubble({
    required this.text,
    required this.isBot,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBot ? Alignment.topLeft : Alignment.topRight,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isBot ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatBotScreen(),
  ));
}
