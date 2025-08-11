import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
// Import semua halaman Anda
import 'package:ppkdb3/tugas_6/dashboard_page.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
// ... import halaman lain

class AppDrawer extends StatelessWidget {
  final Map<String, dynamic> userData;

  const AppDrawer({super.key, required this.userData});

  // Fungsi helper untuk navigasi pintar
  void _navigateTo(BuildContext context, String newRouteName) {
    // Tutup drawer terlebih dahulu
    Navigator.pop(context);

    // Dapatkan nama rute halaman saat ini
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;

    // Jika kita sudah di halaman tujuan, jangan lakukan apa-apa
    if (currentRouteName == newRouteName) {
      return;
    }

    // LOGIKA INTI:
    // Jika halaman saat ini adalah Dashboard, gunakan PUSH.
    // Jika tidak, berarti kita sedang di halaman lain, gunakan REPLACEMENT.
    if (currentRouteName == DashboardPage.routeName) {
      Navigator.pushNamed(context, newRouteName);
    } else {
      Navigator.pushReplacementNamed(context, newRouteName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userData['email'] ?? 'No Email'),
            accountEmail: Text(userData['password'] ?? 'No Password'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              // Untuk kembali ke Dashboard, selalu gunakan popUntil
              Navigator.of(context).popUntil(
                (route) =>
                    route.settings.name == DashboardPage.routeName ||
                    route.isFirst,
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.check_box),
            title: const Text('CheckBox Testing'),
            onTap: () => _navigateTo(context, CheckBoxTesting.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.toggle_on),
            title: const Text('Switch Testing'),
            onTap: () => _navigateTo(context, SwitchTesting.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.date_range),
            title: const Text('DatePicker Testing'),
            onTap: () => _navigateTo(context, DatePickerTest.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.lock_clock),
            title: const Text('TImePacker Testing'),
            onTap: () => _navigateTo(context, TimePackerTesting.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle_outlined),
            title: const Text('Dropdown Testing'),
            onTap: () => _navigateTo(context, DropdownTesting.routeName),
          ),

          // ... tambahkan untuk item lain dengan pola yang sama
        ],
      ),
    );
  }
}
