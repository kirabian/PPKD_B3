import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class DatePickerTest extends StatefulWidget {
  static const String routeName = '/datepicker';
  const DatePickerTest({super.key});

  @override
  State<DatePickerTest> createState() => _DatePickerTestState();
}

class _DatePickerTestState extends State<DatePickerTest> {
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

  String? tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(userData: {}),

      appBar: AppBar(title: const Text("Pilih Tanggal Lahir")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text("Pilih Tanggal Lahir"),
                onPressed: () async {
                  var selectedDate = await DatePicker.showSimpleDatePicker(
                    context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                    dateFormat: "dd-MMMM-yyyy",
                    locale: DateTimePickerLocale.id,
                    looping: true,
                  );

                  if (selectedDate != null) {
                    setState(() {
                      tanggalLahir =
                          "Tanggal Lahir: ${DateFormat('d MMMM yyyy', 'id_ID').format(selectedDate)}";
                    });
                  }
                },
              ),
              const SizedBox(height: 20),
              if (tanggalLahir != null)
                Text(
                  tanggalLahir!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
