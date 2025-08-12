import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class BukuList extends StatefulWidget {
  static const String routeName = '/bukulist';
  const BukuList({super.key});

  @override
  State<BukuList> createState() => _BukuListState();
}

class _BukuListState extends State<BukuList> {
  int _selectedIndex = 0;

  // 3. Buat fungsi untuk menangani ketika item di-tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Di sini Anda bisa menambahkan logika navigasi atau aksi lain
    // berdasarkan index yang di-tap. Contoh:
    switch (index) {
      case 0:
        // Navigasi ke halaman Home
        // Navigator.pushNamed(context, '/home');
        break;
      case 1:
        // Navigasi ke halaman Favorite
        break;
      // dan seterusnya...
    }
  }

  final List<String> takdirKami = [
    "Raib",
    "Seli",
    "Ali",
    "Miss Selena",
    "Batozar",
    "Tamus",
    "Av",
    "Ou",
    "Buku Kehidupan",
    "Si Tanpa Mahkota",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Buku')),
      drawer: const AppDrawer(userData: {}),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),

              shrinkWrap: true,
              itemCount: takdirKami.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(takdirKami[index]),
                  leading: CircleAvatar(child: Text("${index + 1}")),
                );
              },
            ),
            Divider(),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
