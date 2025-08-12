import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas9/bukulist.dart';
import 'package:ppkdb3/tugas9/bukumap.dart';
import 'package:ppkdb3/tugas9/modelcallsbuku.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/main_page.dart'; // DIUBAH: Impor MainPage, bukan DashboardPage
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
    // Jika halaman saat ini adalah MainPage (halaman utama), gunakan PUSH.
    // Jika tidak, berarti kita sedang di halaman lain, gunakan REPLACEMENT.
    if (currentRouteName == MainPage.routeName) {
      // DIUBAH
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
            decoration: const BoxDecoration(
              color: Colors.blue, // Anda bisa menambahkan dekorasi
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/backgrounds/download.jpg",
                ), // Contoh background
                fit: BoxFit.cover,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              // Untuk kembali ke halaman utama, selalu gunakan popUntil
              Navigator.of(context).popUntil(
                (route) =>
                    route.settings.name == MainPage.routeName || // DIUBAH
                    route.isFirst,
              );
            },
          ),

          const Divider(), // Garis pemisah untuk kerapian

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
            leading: const Icon(Icons.access_time), // Icon lebih sesuai
            title: const Text('TimePicker Testing'), // Typo diperbaiki
            onTap: () => _navigateTo(context, TimePackerTesting.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle_outlined),
            title: const Text('Dropdown Testing'),
            onTap: () => _navigateTo(context, DropdownTesting.routeName),
          ),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('Book List'),
            onTap: () => _navigateTo(context, BukuList.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.menu_book_rounded),
            title: const Text('Book List Map'),
            onTap: () => _navigateTo(context, BukuMap.routeName),
          ),

          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Book Model'),
            onTap: () => _navigateTo(context, ModelBuku.routeName),
          ),

          // ... tambahkan untuk item lain dengan pola yang sama
        ],
      ),
    );
  }
}
