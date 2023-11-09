import 'package:assignmenttwo/screens/menuscreen/productList.dart';
import 'package:assignmenttwo/screens/menuscreen/profile.dart';
import 'package:assignmenttwo/screens/menuscreen/watchlist.dart';
import 'package:flutter/material.dart';

class Menuscreen extends StatefulWidget {
  const Menuscreen({super.key});

  @override
  State<Menuscreen> createState() => _MenuscreenState();
}

class _MenuscreenState extends State<Menuscreen> {
 int _selectedIndex = 0;
 static const List<Widget> _widgetOptions = <Widget>[ProductList(),WatchList(), profileList()];

  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("List Page"), backgroundColor: Colors.black,
      // ),
      body:Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
         type: BottomNavigationBarType.fixed, // Fixed 
         backgroundColor: Colors.black, // <-- This works for fixed
         selectedItemColor: Colors.white,
         unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}