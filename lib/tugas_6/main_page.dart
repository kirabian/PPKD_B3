import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';
import 'package:ppkdb3/tugas_6/dashboard_page.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/main';

  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    const DashboardContent(), // Tanpa userData
    const Center(
      child: Text("Favourite Page", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("Add Page", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("Search Page", style: TextStyle(color: Colors.white)),
    ),
    const AboutMePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(), // Tanpa userData
      extendBody: true,
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/backgrounds/download.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Center(child: _pages[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
