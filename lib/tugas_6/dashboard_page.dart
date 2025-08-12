import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart'; // Impor WattpadClone jika masih dibutuhkan

// Ubah nama dari DashboardPage menjadi DashboardContent agar lebih jelas
// dan ubah menjadi StatelessWidget karena tidak mengelola state lagi.
class DashboardContent extends StatelessWidget {
  // Hapus routeName karena ini bukan lagi halaman penuh
  final Map<String, String> userData;

  const DashboardContent({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    // HANYA return kontennya, BUKAN Scaffold
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
            "Email: ${userData['email']}",
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "Password: ${userData['password']}",
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
}

// Widget AboutMePage bisa tetap sama karena sudah merupakan widget konten
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
