import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_project/views/profile_screen/profile_screen.dart';
import '../../providers/home_page_provider.dart';
import '../attendence_screen/attendence_screen.dart';
import '../home_screen/homeScreen.dart';


class HomePage extends StatelessWidget {
  static  List<Widget> _pages = <Widget>[
    HomeScreen(),
    AttendanceScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<HomePageStateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('School Management'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Fees'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages.elementAt(pageProvider.selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: pageProvider.selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          pageProvider.updateIndex(index);
        },
      ),
    );
  }
}
