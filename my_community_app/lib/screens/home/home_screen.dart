import 'package:flutter/material.dart';
import 'app_bodies/settings/settings_screen.dart';
import 'app_bodies/events/events_screen.dart';
import 'app_bodies/chats/chats_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; //Navigation index selected
  final _widgetOptions = [
    //App bodies
    ChatsScreen(), /*
    EventsScreen(),
    SettingsScreen(),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App main scaffold
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.blue[800],
            ),
            title: Text('Chat'),
          ),
          /*
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.blue[800],
            ),
            title: Text('Events'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.blue[800],
            ),
            title: Text('Settings'),
          ),
          */
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    //Change the app body
    setState(() {
      _selectedIndex = index;
    });
  }
}
