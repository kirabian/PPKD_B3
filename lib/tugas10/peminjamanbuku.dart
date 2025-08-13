import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:ppkdb3/tugas10/buktipeminjaman.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class PeminjamanBuku extends StatefulWidget {
  static const String routeName = '/peminjamanbuku';
  const PeminjamanBuku({super.key});

  @override
  State<PeminjamanBuku> createState() => _PeminjamanBukuState();
}

class _PeminjamanBukuState extends State<PeminjamanBuku> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Logika navigasi untuk bottom nav bisa ditambahkan di sini
  }

  // Kunci untuk mengidentifikasi dan memvalidasi Form
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController bukuController = TextEditingController();

  @override
  void dispose() {
    // Selalu dispose controller untuk menghindari memory leak
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    bukuController.dispose();
    super.dispose();
  }

  /// Menampilkan dialog konfirmasi setelah data berhasil divalidasi.
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Mencegah dialog ditutup saat tap di luar
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: const Text("Konfirmasi Peminjaman"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/animations/Success.json', // Ganti dengan path animasi sukses Anda
                height: 150,
                width: 150,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              const Text(
                "Data Anda akan disimpan. Lanjutkan untuk melihat bukti peminjaman.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Batal"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Lanjutkan"),
              onPressed: () {
                // Tutup dialog terlebih dahulu
                Navigator.of(context).pop();
                // Kemudian navigasi ke halaman bukti peminjaman
                Navigator.pushReplacement(
                  // Menggunakan pushReplacement agar tidak bisa kembali ke form
                  context,
                  MaterialPageRoute(
                    builder: (context) => BuktiPeminjaman(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text.isEmpty
                          ? null
                          : phoneController.text,
                      buku: bukuController.text,
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        userData: const {},
      ), // Pastikan AppDrawer bisa menerima data
      appBar: AppBar(
        title: const Text("Form Peminjaman Buku"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Data Peminjam",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Silakan isi data di bawah ini dengan benar.",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                // --- Input Fields (Tidak ada perubahan) ---
                const Text(
                  "Judul Buku",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: bukuController,
                  decoration: const InputDecoration(
                    hintText: "Contoh: Laskar Pelangi",
                    prefixIcon: Icon(Icons.menu_book),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Judul buku tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Nama Lengkap",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: "Contoh: Fabian",
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Alamat Email",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: "Contoh: fabian@test.com",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Masukkan format email yang valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  "Nomor Telepon (Opsional)",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(
                    hintText: "Contoh: 081234567890",
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),

                // --- Tombol Simpan ---
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      // Cek apakah semua input valid
                      if (_formKey.currentState!.validate()) {
                        // Jika valid, panggil fungsi untuk menampilkan dialog sukses
                        _showSuccessDialog();
                      }
                    },
                    child: const Text(
                      "Simpan dan Lanjutkan",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // --- Tombol Fitur Belum Tersedia ---
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
