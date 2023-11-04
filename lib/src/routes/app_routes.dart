import 'package:app_petfind/src/screens/welcome_screen.dart';
import 'package:app_petfind/src/screens/chat_bot_screen.dart';
import 'package:app_petfind/src/screens/register_screen.dart';
import 'package:flutter/material.dart';

//clase

class AppRoutes {
  static const String welcome = '/';
  static const String home = '/login';
  static const String login = '/home';
  static const String register = '/register';
  static const String chat = '/chat';

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        welcome: (context) => WelcomeScreen(),
        // home: (context) => HomeScreen(),
        // login: (context) =>  LoginScreen(),
        register: (context) =>  RegisterScreen(),
        chat: (context) =>  ChatBotScreen(),
      };

  static Map<String, String> names(BuildContext context) => {
        welcome: 'Welcome',
        home: 'Home',
        login: 'Login',
        register: 'Register',
        chat: 'Chat',
      };
}
