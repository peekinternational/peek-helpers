import 'package:flutter/material.dart';
import 'package:peek_helpers_flutter/screens/home.dart';
import 'package:peek_helpers_flutter/utils/ai_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  //_MyCreation

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
         return const Home();
      case 1:
        return const Center(
          child: Text('Upcoming'),
        );
      case 2:
        return const Center(
          child: Text('Add'),
        );
      case 3:
        return const Center(
          child: Text('Notifs'),
        );
      case 4:
        return const Center(
          child: Text('Profile'),
        );
      default:
        return const Text("Error");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
  
      // body: screens[_currentIndex],
      body: _getDrawerItemWidget(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/bottomIcons/ic_wrench.png")), label: 'SERVICES'),
            BottomNavigationBarItem(icon: ImageIcon(AssetImage("assets/bottomIcons/ic_briefcase.png")), label: 'JOBS'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'ACCOUNT'),
          BottomNavigationBarItem(icon: Icon(Icons.read_more_outlined), label: 'OPTIONS'),
        ],
        selectedItemColor: AIColors.primaryColor1,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}


