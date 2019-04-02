import 'package:flutter/material.dart';
import 'package:my_community_app/screens/home_screen.dart';
import 'package:my_community_app/screens/login_screen.dart';
import 'package:my_community_app/screens/register_screen.dart';

class MyCommunityApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    'home-screen': (context) => HomeScreen(),
    'login-screen': (context) => LoginScreen(),
    'register-screen': (context) => RegisterScreen(),
  };

  MaterialApp buildMaterialApp() {
    return MaterialApp(
      title: 'My community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      home: HomeScreen(title: 'Home Screen'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildMaterialApp();
  }
}
