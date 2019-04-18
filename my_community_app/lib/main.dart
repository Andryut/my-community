import 'package:flutter/material.dart';
import 'package:my_community_app/screens/home/home_screen.dart';
import 'package:my_community_app/screens/login_screen.dart';
import 'package:my_community_app/screens/register_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    FirebaseAuth _auth = FirebaseAuth.instance;
    _auth.signInWithEmailAndPassword(
        email: 'taster@gmail.com', password: 'tasterpassword');
    _auth.currentUser().then((firebaseUser) {
        print('\n\n' + firebaseUser.email + 'logged\n\n');
          FirebaseDatabase.instance
              .reference()
              .child('recent')
              .child(firebaseUser.uid)
              .set({'title': 'Realtime db rocks', 'created_at': 3});
        }).catchError((error) => print('\n\n' + error + '\n\n'));
    return buildMaterialApp();
  }
}
