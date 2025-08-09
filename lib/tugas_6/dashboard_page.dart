import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

class DashboardPage extends StatelessWidget {
  final Map<String, String> userData;

  const DashboardPage({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: const Color(0xFF00224F),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selamat Datang di Dashboard!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF00224F),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Email: ${userData['email']}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Password: ${userData['password']}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Hapus semua halaman sebelumnya (A & B hilang)
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
            ),
          ],
        ),
      ),
    );
  }
}
