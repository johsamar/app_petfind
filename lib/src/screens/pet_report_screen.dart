import 'package:app_petfind/src/models/PetModel.dart';
import 'package:app_petfind/src/models/ReportModelUserPet.dart';
import 'package:app_petfind/src/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PetReportScreen extends StatefulWidget {
  final ReportModelUserPet? report;
  const PetReportScreen({super.key, this.report});

  @override
  State<PetReportScreen> createState() => _PetReportScreenState();
}

class _PetReportScreenState extends State<PetReportScreen> {
  ReportModelUserPet? get report => widget.report;

  PetModel? get pet => report?.pet;
  UserModel? get user => report?.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reporte de Mascota'),
        ),
        body: (pet == null
            ? const Center(
                child: Text("No data"),
              )
            : ListView(
                children: <Widget>[
                  // Título: "Mascota Encontrada" o "Mascota Perdida"
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Mascota Perdida',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),

                  // Slider de imágenes
                  imageSlider(pet!.images),

                  // Información de ubicación
                  // LocationInfo(),

                  // Cajones de sexo, edad y raza
                  infoPetContainer(pet!),

                  // Contenedor de información del usuario
                  userInfoContainer(
                    user!.name,
                    user!.profilePicture,
                    user!.cellphone,
                    'mensaje',
                    'Comentarios y detalles adicionales.',
                  ),
                ],
              )));
  }
}

Widget imageSlider(List<String>? imageUrls) {
  return CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      enlargeCenterPage: true,
    ),
    items: imageUrls!.map((imageUrl) {
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

Widget infoPetContainer(PetModel? pet) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Text(
              'Especie:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(pet!.specie),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Edad:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(pet.age),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Raza:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(pet.breed),
          ],
        ),
      ),
    ],
  );
}

Widget userInfoContainer(String? name, String? image, String? whatsapp,
    String? message, String? comments) {
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
                AssetImage(image!), // Reemplaza con la imagen del usuario
          ),
          SizedBox(
              width: 16), // Espacio entre la foto y la columna de información

          // Columna con el nombre, ícono de WhatsApp y ícono de mensaje
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name!,
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
                icon:
                    Icon(Icons.phone, color: Colors.green), // Ícono de WhatsApp
                onPressed: () {
                  // Implementa la lógica para redirigir a WhatsApp
                },
              ),
              IconButton(
                icon:
                    Icon(Icons.message, color: Colors.blue), // Ícono de mensaje
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
