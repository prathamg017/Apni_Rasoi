import 'package:apnirasoi/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ApniRasoi-Ghar Jaisa Swaad !',
      debugShowCheckedModeBanner: false,
      home: homepage(),
    );
  }
}
