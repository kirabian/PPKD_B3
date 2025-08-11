import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class SwitchTesting extends StatefulWidget {
  // 1. Menambahkan nama rute untuk navigasi
  static const String routeName = '/switch';

  const SwitchTesting({super.key});

  @override
  State<SwitchTesting> createState() => _SwitchTestingState();
}

class _SwitchTestingState extends State<SwitchTesting> {
  bool val = false; // false = terang, true = gelap

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
      backgroundColor: val ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        title: Text(
          'Switch Testing',
          // Menambahkan style agar warna teks judul ikut berubah
          style: TextStyle(color: val ? Colors.white : Colors.black),
        ),
        centerTitle: true,
        // Mengubah warna ikon drawer agar terlihat di kedua mode
        iconTheme: IconThemeData(color: val ? Colors.white : Colors.black),
        backgroundColor: val ? Colors.black : Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aktifkan Mode Gelap",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: val ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            DayNightSwitch(
              value: val,
              moonImage: const AssetImage('assets/images/backgrounds/moon.png'),
              sunImage: const AssetImage('assets/images/backgrounds/sun.png'),
              sunColor: Colors.yellow,
              moonColor: Colors.white,
              dayColor: Colors.blue,
              nightColor: Colors.black,
              onChanged: (value) {
                setState(() {
                  val = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              val ? "Mode Gelap Aktif" : "Mode Terang Aktif",
              style: TextStyle(
                fontSize: 16,
                color: val ? Colors.white70 : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
