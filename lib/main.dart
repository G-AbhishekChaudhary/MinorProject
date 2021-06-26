import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:task4/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Colors.green,
      seconds: 6,
      navigateAfterSeconds: new First(),
      title: new Text(
        'MyApp',
        textScaleFactor: 2,
      ),
      image: new Image.asset("images/first_image.png"),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.white,
    );
  }
}
