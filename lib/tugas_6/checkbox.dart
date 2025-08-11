import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class CheckBoxTesting extends StatefulWidget {
  // 1. Menambahkan nama rute untuk navigasi
  static const String routeName = '/checkbox';

  const CheckBoxTesting({super.key});

  @override
  State<CheckBoxTesting> createState() => _CheckBoxTestingState();
}

class _CheckBoxTestingState extends State<CheckBoxTesting> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    // Ambil userData yang dikirim melalui argumen rute
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final userData =
        arguments as Map<String, dynamic>? ??
        {}; // Default ke map kosong jika null

    return Scaffold(
      // 2. Berikan userData yang diterima ke AppDrawer
      drawer: AppDrawer(userData: userData),
      appBar: AppBar(
        // 3. Memperbaiki judul halaman
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
    );
  }
}
