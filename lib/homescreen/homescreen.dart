
import 'package:favoriteitemshow/homescreen/favoriteItem.dart';
import 'package:favoriteitemshow/homescreen/homepage.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  void onTabTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    const HomePage(),
    const FavoriteItem(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.orange.shade800,
        backgroundColor: Colors.grey.shade400,
        currentIndex: selectedIndex,
        onTap: onTabTapped,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),


      ],
      ),
    );
  }
}
