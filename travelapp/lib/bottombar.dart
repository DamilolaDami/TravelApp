import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar({Key key}) : super(key: key);
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var bottoomNavStyle = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86.4,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Settings',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedFontSize: 12,
          onTap: _onTapped,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28,
          elevation: 5),
    );
  }
}
