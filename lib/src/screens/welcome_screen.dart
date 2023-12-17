import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(
              //from url
              // image: NetworkImage('https://petfinds3.s3.amazonaws.com/pets/cat/3bd0d583-b23a-4ac3-9741-8a8d65c5f397.jpg'),
              image: AssetImage('assets/images/logo.png'),
              height: 200, // Ajusta la altura según tus necesidades
              width: 200, // Ajusta el ancho según tus necesidades
              fit: BoxFit.contain, // Controla cómo se ajusta la imagen
            ),

            // Título
            const Text(
              'Welcome to My App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Subtítulo
            const Text(
              'EFind your lost or found pet with PetFind AI',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text("Let's Get Started"),
            ),
          ],
        ),
      ),
    );
  }
}
