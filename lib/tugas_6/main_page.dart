import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart'; // Impor bottom nav BARU kita
import 'package:ppkdb3/tugas_6/app_drawer.dart'; // Impor drawer Anda
import 'package:ppkdb3/tugas_6/dashboard_page.dart'; // Impor halaman konten dashboard

class MainPage extends StatefulWidget {
  // Ganti nama routeName ke sini agar lebih sesuai
  static const String routeName = '/main';
  final Map<String, String> userData;

  const MainPage({super.key, required this.userData});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  // Daftar halaman/konten yang akan ditampilkan sesuai index
  // Perhatikan: DashboardPage sekarang menjadi salah satu item di sini
  late final List<Widget> _pages = [
    DashboardContent(
      userData: widget.userData,
    ), // Halaman Home (konten dashboard)
    const Center(
      child: Text("Favourite Page", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("Add Page", style: TextStyle(color: Colors.white)),
    ),
    const Center(
      child: Text("Search Page", style: TextStyle(color: Colors.white)),
    ),
    const AboutMePage(), // Halaman About Me
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Panggil AppDrawer yang sudah ada
      drawer: AppDrawer(userData: widget.userData),
      extendBody: true, // Agar background terlihat di belakang nav bar
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/backgrounds/download.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          // Tampilkan halaman yang dipilih
          Center(child: _pages[_selectedIndex]),
        ],
      ),
      // 2. Panggil AppBottomNavigationBar yang baru kita buat
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped, // Kirim fungsi callback
      ),
    );
  }
}
