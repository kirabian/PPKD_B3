import 'package:flutter/material.dart';

class BuktiPeminjaman extends StatelessWidget {
  const BuktiPeminjaman({
    super.key,
    required this.email,
    this.phone,
    required this.name,
    required this.buku,
    required this.domisili,
  });

  final String email;
  final String? phone;
  final String name;
  final String buku;
  final String domisili;

  @override
  Widget build(BuildContext context) {
    // Menggunakan warna tema untuk tampilan yang konsisten
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // Memberi warna latar belakang yang sedikit abu-abu agar Card terlihat menonjol
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Bukti Peminjaman"),
        backgroundColor: Colors.white,
        elevation: 1, // Bayangan tipis untuk app bar
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          // Memberi jarak dari tepi layar
          padding: const EdgeInsets.all(16.0),
          child: Card(
            // Memberi bayangan pada kartu
            elevation: 4.0,
            // Membuat sudut kartu menjadi tumpul
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              // Memberi jarak di dalam kartu
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 24.0,
              ),
              child: Column(
                // Membuat tinggi Column sesuai dengan isinya
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- Bagian Header Kartu ---
                  Icon(
                    Icons.check_circle_outline,
                    color: colorScheme.primary,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Peminjaman Berhasil",
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Harap simpan bukti ini dengan baik.",
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const Divider(), // Garis pemisah
                  const SizedBox(height: 16),

                  // --- Detail Peminjaman ---
                  ListTile(
                    leading: const Icon(Icons.menu_book),
                    title: const Text("Judul Buku"),
                    subtitle: Text(
                      buku,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Nama Peminjam"),
                    subtitle: Text(
                      name,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text("Email"),
                    subtitle: Text(
                      email,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text("Nomor Telepon"),
                    subtitle: Text(
                      phone ?? "Tidak ada",
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.location_city),
                    title: const Text("domisili"),
                    subtitle: Text(
                      domisili,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
