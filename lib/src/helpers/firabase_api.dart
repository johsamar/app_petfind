import 'package:app_petfind/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackground(RemoteMessage message) async {
  print('Título: ${message.notification?.title}');
  print('Cuerpo: ${message.notification?.body}');
  print('Data: ${message.data}');
}

void handleMessages(RemoteMessage? message) {
  if (message == null) return;
  navigatorKey.currentState?.pushNamed(
    '/map',
    arguments: message,
  );
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.instance.getInitialMessage().then(handleMessages);
  FirebaseMessaging.onMessage.listen(handleMessages);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessages);
  FirebaseMessaging.onBackgroundMessage(handleBackground);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print('Token: $token');    

    initPushNotifications();
  }
}
