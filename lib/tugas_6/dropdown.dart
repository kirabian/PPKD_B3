import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class DropdownTesting extends StatefulWidget {
  static const String routeName = '/dropdown';
  const DropdownTesting({super.key});

  @override
  State<DropdownTesting> createState() => _DropdownTestingState();
}

class _DropdownTestingState extends State<DropdownTesting> {
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

  String? dropdownSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(userData: {}),
      appBar: AppBar(title: const Text('Dropdown Testing'), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Ini halaman Dropdown Testing",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              DropdownButton<String>(
                value: dropdownSelect,
                hint: const Text("Pilih Produk"),
                items: ["Elektronik", "Pakaian", "Makanan", "Lainnya"].map((
                  String value,
                ) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownSelect = value;
                  });
                },
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
              ),
              const SizedBox(height: 20),
              Text(
                dropdownSelect == null
                    ? "Anda belum memilih produk"
                    : "Produk yang dipilih: $dropdownSelect",
                style: const TextStyle(fontSize: 16),
              ),
            ],
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
