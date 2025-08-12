import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class CheckBoxTesting extends StatefulWidget {
  static const String routeName = '/checkbox';

  const CheckBoxTesting({super.key});

  @override
  State<CheckBoxTesting> createState() => _CheckBoxTestingState();
}

class _CheckBoxTestingState extends State<CheckBoxTesting> {
  bool isCheck = false;
  // 2. Tambahkan state untuk melacak item yang dipilih di bottom navigation
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

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final userData = arguments as Map<String, dynamic>? ?? {};

    return Scaffold(
      drawer: AppDrawer(userData: userData),
      appBar: AppBar(
        title: const Text('CheckBox Testing'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Saya menyetujui semua persyaratan yang berlaku",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Checkbox(
              activeColor: Colors.red,
              value: isCheck,
              onChanged: (value) {
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            const SizedBox(height: 8),
            Text(
              isCheck == true
                  ? "Lanjutkan pendaftaran diperbolehkan"
                  : "Anda belum bisa melanjutkan",
              style: TextStyle(
                fontSize: 16,
                color: isCheck == true ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      // 4. Tambahkan AppBottomNavigationBar ke Scaffold
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
