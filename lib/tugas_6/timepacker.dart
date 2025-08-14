import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas_6/app_bottom_nav.dart';
import 'package:ppkdb3/tugas_6/app_drawer.dart';

class TimePackerTesting extends StatefulWidget {
  static const String routeName = '/timepacker';
  const TimePackerTesting({super.key});

  @override
  State<TimePackerTesting> createState() => _TimePackerTestingState();
}

class _TimePackerTestingState extends State<TimePackerTesting> {
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

  // Gunakan tipe Time dari package
  Time selectedTime = Time(hour: 12, minute: 0);

  void onTimeChanged(Time newTime) {
    setState(() {
      selectedTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text('Time Picker Testing'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Waktu terpilih: ${selectedTime.format(context)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.of(context).push(
                  showPicker(
                    context: context,
                    value: selectedTime, // Sudah tipe Time
                    sunrise: const TimeOfDay(hour: 6, minute: 0),
                    sunset: const TimeOfDay(hour: 18, minute: 0),
                    duskSpanInMinutes: 120,
                    onChange: onTimeChanged,
                  ),
                );
              },
              child: const Text(
                "Open time picker",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
