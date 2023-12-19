import 'package:app_petfind/src/providers/AuthProvider.dart';
import 'package:app_petfind/src/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
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
      body: SingleChildScrollView(
        child: Padding(
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
              onPressed: () {
                var response =
                    login(_userController.text, _passwordController.text);

                response.then((value) => {
                      if (value != null)
                        {
                          authProvider.login(),
                          authProvider.setUserId(value),
                          _login(),
                        }
                      else
                        {
                          // mensaje de error
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Error al crear la mascota')),
                          )
                        }
                    });
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
      )
    );
  }

  void _login() {
    Navigator.pushReplacementNamed(context, '/chat');
  }
}
