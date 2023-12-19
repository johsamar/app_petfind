import 'package:app_petfind/src/screens/register_pet.dart';
import 'package:app_petfind/src/screens/reports/list_my_pet_report.dart';
import 'package:app_petfind/src/screens/reports/register_pet_report.dart';
import 'package:app_petfind/src/screens/reports/report_screen.dart';
import 'package:app_petfind/src/screens/welcome_screen.dart';
import 'package:app_petfind/src/screens/chat_bot_screen.dart';
import 'package:app_petfind/src/screens/register_screen.dart';
import 'package:app_petfind/src/screens/pet_report_screen.dart';
import 'package:app_petfind/src/screens/map_screen.dart';
import 'package:app_petfind/src/screens/list_my_pets.dart';
// import 'package:app_petfind/src/screens/charge_images.dart';
import 'package:app_petfind/src/screens/login_screen.dart';
import 'package:flutter/material.dart';

//clase

class AppRoutes {
  static const String welcome = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String report = '/report';
  static const String chat = '/chat';
  static const String map = '/map';
  static const String picker = '/picker';
  static const String registerPet = '/register_pet';
  static const String myPets = '/my_pets';
  static const String listMyPetsToReport = '/list_my_pets_to_report';
  static const String reportSighting = '/report_sighting';

  static Map<String, WidgetBuilder> routes(BuildContext context) => {
        welcome: (context) => WelcomeScreen(),
        home: (context) => WelcomeScreen(),
        login: (context) => LoginScreen(),
        // picker: (context) => ImagePickerScreen(),
        registerPet: (context) =>  RegisterPetScreen(),
        register: (context) =>  RegisterScreen(),
        chat: (context) =>  ChatBotScreen(),
        map: (context) =>  MapScreen(),
        myPets: (context) =>  ListMyPets(),
        listMyPetsToReport: (context) =>  ListMyPetsToReport(),
        reportSighting: (context) =>  RegisterPetReportScreen(),

      };

  static Map<String, String> names(BuildContext context) => {
        welcome: 'Welcome',
        home: 'Home',
        login: 'Login',
        register: 'Register',
        chat: 'Chat',
        map: 'Map',
        picker: 'Picker',
        registerPet: 'Register Pet',
        myPets: 'My Pets',
        listMyPetsToReport: 'List My Pets To Report',
        reportSighting: 'Report Sighting',
      };
}
