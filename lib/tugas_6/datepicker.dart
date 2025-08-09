import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';

class DatePickerTest extends StatefulWidget {
  const DatePickerTest({super.key});

  @override
  State<DatePickerTest> createState() => _DatePickerTestState();
}

class _DatePickerTestState extends State<DatePickerTest> {
  String? tanggalLahir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
