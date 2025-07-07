import 'package:flutter/material.dart';
import 'World Time/pages/choose_location.dart';
import 'World Time/pages/home.dart';
import 'World Time/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/Location': (context) => ChooseLocation(),
  },
));