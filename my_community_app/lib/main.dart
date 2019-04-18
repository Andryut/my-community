import 'package:flutter/material.dart';
import 'package:my_community_app/screens/home/home_screen.dart';
import 'package:my_community_app/screens/auth/login_screen.dart';
import 'package:my_community_app/screens/auth/register_screen.dart';

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
      home: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }
}
