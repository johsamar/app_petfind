import 'package:app_petfind/src/screens/register_pet.dart';
import 'package:app_petfind/src/screens/welcome_screen.dart';
import 'package:app_petfind/src/screens/chat_bot_screen.dart';
import 'package:app_petfind/src/screens/register_screen.dart';
import 'package:app_petfind/src/screens/pet_report_screen.dart';
import 'package:app_petfind/src/screens/map_screen.dart';
import 'package:flutter/material.dart';

//clase

class AppRoutes {
  static const String welcome = '/';
  static const String home = '/login';
  static const String login = '/home';
  static const String register = '/register';
  static const String report = '/report';
  static const String chat = '/chat';
  static const String map = '/map';
  static const String register_pet = '/register_pet';

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        welcome: (context) => WelcomeScreen(),
        // home: (context) => HomeScreen(),
        register_pet: (context) =>  RegisterPetScreen(),
        report: (context) =>  PetReportScreen(),
        register: (context) =>  RegisterScreen(),
        chat: (context) =>  ChatBotScreen(),
        map: (context) =>  MapScreen(),
      };

  static Map<String, String> names(BuildContext context) => {
        welcome: 'Welcome',
        home: 'Home',
        login: 'Login',
        register: 'Register',
        chat: 'Chat',
      };
}
