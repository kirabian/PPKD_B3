import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';

class SwitchTesting extends StatefulWidget {
  const SwitchTesting({super.key});

  @override
  State<SwitchTesting> createState() => _SwitchTestingState();
}

class _SwitchTestingState extends State<SwitchTesting> {
  bool val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: val
          ? Colors.black
          : Colors.white, // warna background dinamis
      appBar: AppBar(
        title: const Text('Switch Testing'),
        centerTitle: true,
        backgroundColor: val
            ? const Color.fromARGB(255, 255, 255, 255)
            : Colors.blue, // appbar ikut berubah
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aktifkan Mode Gelap",
              style: TextStyle(
                fontSize: 18,
                color: val
                    ? Colors.white
                    : Colors.black, // teks menyesuaikan mode
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
                color: val
                    ? Colors.white
                    : Colors.black, // teks menyesuaikan mode
              ),
            ),
          ],
        ),
      ),
    );
  }
}
