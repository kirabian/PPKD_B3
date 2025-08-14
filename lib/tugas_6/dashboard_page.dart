import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/widgets/log_out_button.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Selamat Datang di Dashboard!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),

          // 2. Ganti ElevatedButton yang lama dengan widget LogOutButton Anda
          LogOutButton(),
        ],
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

// Tambahkan widget LogOutButton di file terpisah agar lebih rapi.
// Misalnya: lib/tugas11/logout_button.dart
/*
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/preference/shared_preference.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Logika logout sekarang terpusat di sini
        PreferenceHandler.removeLogin();
        Navigator.pushReplacementNamed(context, WattpadClone.routeName);
      },
      child: const Text("Keluar"),
    );
  }
}
*/
