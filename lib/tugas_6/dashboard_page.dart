import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/about_me.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

enum _SelectedTab { home, favourite, add, search, profile }

class DashboardPage extends StatefulWidget {
  final Map<String, String> userData;

  const DashboardPage({super.key, required this.userData});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  _SelectedTab _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int index) {
    setState(() {
      _selectedTab = _SelectedTab.values[index];
    });

    if (_SelectedTab.values[index] == _SelectedTab.profile) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AboutMePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DashboardPage(userData: widget.userData),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Me'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutMePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_box),
              title: const Text('CheckBox Testing'),
              onTap: () {
                // Implement settings functionality here
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
                // Implement settings functionality here
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
                // Implement settings functionality here
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
                // Implement settings functionality here
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
                // Implement settings functionality here
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
        backgroundColor: Colors.transparent, // transparan
        elevation: 0, // hilangkan shadow
      ),
      body: Stack(
        children: [
          // background image
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              "assets/images/backgrounds/download.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),

          // content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang di Dashboard!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Email: ${widget.userData['email']}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
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
                      MaterialPageRoute(
                        builder: (context) => const WattpadClone(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: CrystalNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          unselectedItemColor: Colors.white70,
          backgroundColor: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
          borderWidth: 2,
          outlineBorderColor: Colors.white,
          onTap: _handleIndexChanged,
          items: [
            // NOTE: pass IconData (Icons.*), not Icon(...)
            CrystalNavigationBarItem(
              icon: Icons.home,
              unselectedIcon: Icons.home_outlined,
              selectedColor: const Color.fromARGB(255, 255, 255, 255),
              badge: Badge(
                label: Text("9+", style: TextStyle(color: Colors.white)),
              ),
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
              icon: Icons.person,
              unselectedIcon: Icons.person_outline,
              selectedColor: const Color.fromARGB(255, 255, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}
