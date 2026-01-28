import 'package:flutter/material.dart';

class MyNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MyNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,

      // type: BottomNavigationBarType.fixed,
      elevation: 0,
      backgroundColor: Colors.white,

      selectedItemColor: const Color.fromARGB(255, 50, 50, 50),
      unselectedItemColor: const Color.fromARGB(255, 50, 50, 50),

      items: [
        BottomNavigationBarItem(
          icon: _navIcon(
            icon: Icons.home_rounded,
            index: 0,
          ),
          label: 'Accueil',
        ),

        BottomNavigationBarItem(
          icon: _navIcon(
            icon: Icons.category_rounded,
            index: 1,
          ),
          label: 'Catégorie',
        ),

        BottomNavigationBarItem(
          icon: _navIcon(
            icon: Icons.production_quantity_limits_outlined,
            index: 2,
          ),
          label: 'Medias',
        ),
      ],
    );
  }


  Widget _navIcon({
    required IconData icon,
    required int index,
  }) {
    final bool isActive = currentIndex == index;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(
        icon,
        size: 22,
      ),
    );
  }
}
