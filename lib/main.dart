// ignore_for_file: dead_code, unused_label, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:time_for_countries/forpages/pages/home.dart';
import 'package:time_for_countries/forpages/pages/loading.dart';
import 'package:time_for_countries/forpages/pages/zone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/',
  routes: {
    
    '/': (context) =>  Loading(),
    '/second': (context) => Home(),
    '/third' :(context) => Zone(),

  });
  }
}
