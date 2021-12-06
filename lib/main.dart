import 'package:assignment6adv/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MaterialApp(
    darkTheme: ThemeData.dark(),
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: const Text('Firebase database'),
        ),
        body: Home()
      ) ,
    );
  }
}
