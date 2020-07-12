import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  final FirebaseMessaging messaging= FirebaseMessaging();

  Future initialise() async{
     if(Platform.isIOS){
       messaging.requestNotificationPermissions(IosNotificationSettings());
     }

     messaging.configure(
       //Foreground notifier
          onMessage:(Map<String,dynamic> message) async{
          print('onMessage:$message');
         },
      // Background notifier
          onLaunch: (Map<String,dynamic> message) async{
          print('onMessage:$message');
         },
      // Push notifications when app is in background
          onResume: (Map<String,dynamic> message) async{
          print('onMessage:$message');   
          },
     );   
  }
}