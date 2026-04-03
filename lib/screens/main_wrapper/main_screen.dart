import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../search/search_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],

      // Desain Bottom Navbar Minimalis dengan Shadow Halus
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Warna background navbar
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.04,
              ), // Shadow sangat tipis agar tetap elegan
              blurRadius: 20,
              offset: const Offset(0, -4), // Arah shadow ke atas
            ),
          ],
        ),
        child: SafeArea(
          // SafeArea memastikan navbar tidak tertutup indikator gestur di HP modern
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: BottomNavigationBar(
              elevation:
                  0, // Matikan elevation bawaan, gunakan shadow dari Container
              backgroundColor: Colors.transparent, // Ikuti warna dari Container
              iconSize:
                  30, // <-- Ukuran ikon diperbesar (default bawaan adalah 24)
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: Colors.black, // Warna ikon aktif
              unselectedItemColor:
                  Colors.grey[350], // Warna ikon tidak aktif (abu-abu terang)
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined),
                  activeIcon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
