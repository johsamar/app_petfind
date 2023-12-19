import 'package:app_petfind/src/providers/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _userValid = true;
  bool _passwordValid = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Image.asset('assets/images/logo.png', width: 80, height: 80),
            SizedBox(height: 20),

            // Campo de Usuario
            TextFormField(
              controller: _userController,
              decoration: InputDecoration(
                labelText: 'Usuario',
                errorText: _userValid ? null : 'Usuario inválido',
              ),
            ),
            SizedBox(height: 12),

            // Campo de Contraseña
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                errorText: _passwordValid ? null : 'Contraseña inválida',
              ),
            ),
            SizedBox(height: 20),

            // Botón de Iniciar Sesión
            ElevatedButton(
              onPressed: () => {
                authProvider.login(),
                authProvider.setUserId("657f70180062fc8b9d98797c"),
                _login(),
              },
              child: Text('Iniciar Sesión'),
            ),
            SizedBox(height: 12),

            // Texto de Recuperar Contraseña
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/recuperar_contraseña');
              },
              child: Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Colors.blue),
              ),
            ),

            // Texto de Registrarse
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                '¿No tienes una cuenta? ¡Regístrate!',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _login() {
    setState(() {
      _userValid = _userController.text.isNotEmpty;
      _passwordValid = _passwordController.text.isNotEmpty;
    });

    Navigator.pushReplacementNamed(context, '/chat');
  }
}
