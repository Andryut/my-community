import 'package:flutter/material.dart';
import 'app_bodies/settings/settings_screen.dart';
import 'events/events_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 2; //Navigation index selected
  final _widgetOptions = [ //App bodies
    Text('Index 0: Chats'),
    EventsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( // App main scaffold
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.question_answer, color: Colors.blue,), title: Text('Chat')),
          BottomNavigationBarItem(icon: Icon(Icons.people, color: Colors.blue,), title: Text('Events')),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.blue,), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {//Change the app body
    setState(() {
      _selectedIndex = index;
    });
  }
}