import 'package:flutter/material.dart';
import 'package:my_community_app/screens/home/home_screen.dart';
import 'package:my_community_app/screens/login_screen.dart';
import 'package:my_community_app/screens/register_screen.dart';
import 'package:firebase_database/firebase_database.dart';

void main() => runApp(MyCommunityApp());

class MyCommunityApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    'home-screen': (context) => HomeScreen(),
    'login-screen': (context) => LoginScreen(),
    'register-screen': (context) => RegisterScreen(),
  };

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      routes: routes,
      home: HomeScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }
}
