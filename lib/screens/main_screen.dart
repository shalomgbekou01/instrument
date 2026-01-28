
import 'package:flutter/material.dart';
import 'package:instrument/screens/categorie_screen.dart';
import 'package:instrument/screens/consult_screen.dart';
import 'package:instrument/screens/home_screen.dart';
import 'package:instrument/widgets/nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const CategorieScreen(),
    ConsultScreen()
  ];

  void _onNavTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: MyNavBar(
        currentIndex: _currentIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
