import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PetReportScreen extends StatefulWidget {
  const PetReportScreen({super.key});

  @override
  State<PetReportScreen> createState() => _PetReportScreenState();
}

class _PetReportScreenState extends State<PetReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reporte de Mascota'),
      ),
      body: ListView(
        children: <Widget>[
          // Título: "Mascota Encontrada" o "Mascota Perdida"
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Mascota Perdida',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          // Slider de imágenes
          ImageSlider(),

          // Información de ubicación
          LocationInfo(),

          // Cajones de sexo, edad y raza
          InfoPetContainer(),

          // Contenedor de información del usuario
          UserInfoContainer(
            name: 'Nombre',
            image: 'assets/images/user_profile.png',
            whatsapp: '+123456789',
            message: '¡Hola! ¿Encontraste a mi mascota?',
            comments: 'Comentarios y detalles adicionales.',
          ),
        ],
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/images/image1.jpg',
    'assets/images/image2.jpg',
    'assets/images/image3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imageUrls.map((imageUrl) {
        return Container(
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      }).toList(),
    );
  }
}

class LocationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.blue, // Color del icono de ubicación
        ),
        SizedBox(width: 8), // Espacio entre el icono y el texto
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TuBarrio, Ciudad', // Reemplaza con el nombre del barrio
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}

class InfoPetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Column(
            children: [
              Text(
                'Sexo:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Hembra'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edad:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('2 años'),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Raza:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Criollo'),
            ],
          ),
        ),
      ],
    );
  }
}

class UserInfoContainer extends StatelessWidget {
  final String name;
  final String image;
  final String whatsapp;
  final String message;
  final String comments;

  UserInfoContainer({
    required this.name,
    required this.image,
    required this.whatsapp,
    required this.message,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Fila con la foto del usuario, nombre y acciones (WhatsApp y mensaje)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // Foto del usuario
            CircleAvatar(
              radius: 40, // Tamaño del círculo de la foto
              backgroundImage:
                  AssetImage(image), // Reemplaza con la imagen del usuario
            ),
            SizedBox(
                width: 16), // Espacio entre la foto y la columna de información

            // Columna con el nombre, ícono de WhatsApp y ícono de mensaje
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.phone,
                      color: Colors.green), // Ícono de WhatsApp
                  onPressed: () {
                    // Implementa la lógica para redirigir a WhatsApp
                  },
                ),
                IconButton(
                  icon: Icon(Icons.message,
                      color: Colors.blue), // Ícono de mensaje
                  onPressed: () {
                    // Implementa la lógica para abrir la aplicación de mensajes
                  },
                ),
              ],
            ),
          ],
        ),

        // Mensaje del usuario
        Text('Mensaje del Usuario: $message'),

        // Comentarios
        Text('Comentarios: $comments'),
      ],
    );
  }
}
