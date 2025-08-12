import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped; // Callback untuk memberitahu parent

  const AppBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CrystalNavigationBar(
        currentIndex: widget.selectedIndex, // Gunakan dari parameter
        unselectedItemColor: const Color.fromARGB(179, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
        borderWidth: 2,
        outlineBorderColor: const Color.fromARGB(255, 0, 0, 0),
        onTap: widget.onItemTapped, // Panggil callback saat item di-tap
        items: [
          CrystalNavigationBarItem(
            icon: Icons.home,
            unselectedIcon: Icons.home_outlined,
            selectedColor: const Color.fromARGB(255, 255, 6, 6),
          ),
          CrystalNavigationBarItem(
            icon: Icons.favorite,
            unselectedIcon: Icons.favorite_border,
            selectedColor: Colors.red,
          ),
          CrystalNavigationBarItem(
            icon: Icons.add,
            unselectedIcon: Icons.add_circle_outline,
            selectedColor: const Color.fromARGB(255, 255, 0, 0),
          ),
          CrystalNavigationBarItem(
            icon: Icons.search,
            unselectedIcon: Icons.search_outlined,
            selectedColor: const Color.fromARGB(255, 255, 0, 0),
          ),
          CrystalNavigationBarItem(
            icon: Icons.info_outline,
            unselectedIcon: Icons.info_outline,
            selectedColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
