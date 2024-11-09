import 'package:agency_apk/views/personal_view.dart';
import 'package:agency_apk/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'views/agencies_view.dart';
import 'views/statistics_view.dart';
import 'views/calendar_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agency App',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    CalendarView(),
    PersonalView(),
    AgenciesView(),
    StatisticsView(),
    ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: 'Calendar'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cases_outlined), label: 'Personal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Agencies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.analytics_outlined), label: 'Reports'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.orange, // Highlight color for the selected item
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
