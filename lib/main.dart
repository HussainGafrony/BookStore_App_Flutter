import 'package:bookStor/src/screen/auth/login.dart';
import 'package:bookStor/src/screen/bottomitem/itemselect.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String apiToken =
      (prefs.containsKey('api_token')) ? prefs.getString('api_token') : null;
  runApp(MyApp(apiToken));
}

class MyApp extends StatelessWidget {
  String apiTokenFinal;

  MyApp(this.apiTokenFinal);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // splashColor: Colors.white,
        highlightColor: Colors.transparent,
        accentColor: Colors.transparent,
      ),
      //   home: (FirebaseAuth.instance.currentUser == null)
      //       ? LoginScreen()
      //       : ItemSelect(),
      // );
      home: (apiTokenFinal == null) ? LoginScreen() : ItemSelect(),
    );
  }
}
