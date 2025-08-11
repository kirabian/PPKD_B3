import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

class DashboardPage extends StatefulWidget {
  final Map<String, String> userData;

  const DashboardPage({super.key, required this.userData});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // daftar halaman yang akan ditampilkan sesuai index
  late final List<Widget> _widgetOptions = [
    _buildHomeContent(),
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

  Widget _buildHomeContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Selamat Datang di Dashboard!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            "Email: ${widget.userData['email']}",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "Password: ${widget.userData['password']}",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const WattpadClone()),
                (Route<dynamic> route) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Me'),
              onTap: () {
                setState(() => _selectedIndex = 4);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('CheckBox Testing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SizeboxTesting(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.switch_left),
              title: const Text('Switch Testing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SwitchTesting(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.expand_more),
              title: const Text('Dropdown Testing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DropdownTesting(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.date_range),
              title: const Text('DatePicker Testing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DatePickerTest(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.timelapse),
              title: const Text('TimePicker Testing'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TimePackerTesting(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/tugas6',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
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
          Center(child: _widgetOptions[_selectedIndex]),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white70,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
          borderWidth: 2,
          outlineBorderColor: Colors.white,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.favorite,
              unselectedIcon: Icons.favorite_border,
              selectedColor: Colors.red,
            ),
            CrystalNavigationBarItem(
              icon: Icons.add,
              unselectedIcon: Icons.add_circle_outline,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.search,
              unselectedIcon: Icons.search_outlined,
              selectedColor: Colors.white,
            ),
            CrystalNavigationBarItem(
              icon: Icons.info_outline,
              unselectedIcon: Icons.info_outline,
              selectedColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'About This App',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Aplikasi ini dibuat untuk mempelajari\n'
            'materi Flutter seperti Navigasi, Drawer,\n'
            'Bottom Navigation Bar, dan berbagai\n'
            'komponen UI lainnya.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
