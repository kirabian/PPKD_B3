import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas10/peminjamanbuku.dart';
import 'package:ppkdb3/tugas11/views/CatatanTugasSekolah/index_catatan.dart';
import 'package:ppkdb3/tugas11/views/rick_api/views/character_screen.dart';
import 'package:ppkdb3/tugas11/views/user_screen.dart';
import 'package:ppkdb3/tugas9/bukulist.dart';
import 'package:ppkdb3/tugas9/bukumap.dart';
import 'package:ppkdb3/tugas9/modelcallsbuku.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/main_page.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  // Fungsi helper untuk navigasi pintar
  void _navigateTo(BuildContext context, String newRouteName) {
    Navigator.pop(context);
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    if (currentRouteName == newRouteName) return;

    if (currentRouteName == MainPage.routeName) {
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
          const UserAccountsDrawerHeader(
            accountName: Text('Guest User'),
            accountEmail: Text('No Email'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 40),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("assets/images/backgrounds/download.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.of(context).popUntil(
                (route) =>
                    route.settings.name == MainPage.routeName || route.isFirst,
              );
            },
          ),

          const Divider(),

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
            leading: const Icon(Icons.access_time),
            title: const Text('TimePicker Testing'),
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

          const Divider(),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Peminjaman Buku'),
            onTap: () => _navigateTo(context, PeminjamanBuku.routeName),
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.person_4_rounded),
            title: const Text('Data User'),
            onTap: () => _navigateTo(context, UserScreen.routeName),
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Data Catatan Sekolah'),
            onTap: () => _navigateTo(context, CatatanScreen.routeName),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Data API'),
            onTap: () => _navigateTo(context, RickApi.routeName),
          ),
        ],
      ),
    );
  }
}
