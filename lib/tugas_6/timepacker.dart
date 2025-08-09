import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

class TimePackerTesting extends StatefulWidget {
  const TimePackerTesting({super.key});

  @override
  State<TimePackerTesting> createState() => _TimePackerTestingState();
}

class _TimePackerTestingState extends State<TimePackerTesting> {
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
    );
  }
}
