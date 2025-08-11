import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/dashboard_page.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
// Import semua halaman yang akan digunakan dalam navigasi
import 'package:ppkdb3/tugas_6/tugas6.dart'; // Halaman Login (WattpadClone)
// Tambahkan import untuk halaman lain jika ada (misal: dropdown, timepacker)

void main() {
  // Inisialisasi format tanggal untuk bahasa Indonesia
  initializeDateFormatting("id_ID");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Saya',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 255, 230, 0),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,

      // 1. Tentukan halaman awal menggunakan initialRoute
      // Rute '/' akan menunjuk ke WattpadClone (halaman login)
      initialRoute: '/',

      // 2. Daftarkan semua rute aplikasi di sini
      routes: {
        // Rute untuk halaman Login
        '/': (context) => const WattpadClone(),

        // Rute untuk Dashboard. Ini akan mengambil argumen (userData)
        // yang dikirim dari halaman login.
        DashboardPage.routeName: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return DashboardPage(userData: args);
        },

        // Daftarkan halaman lain dari drawer menggunakan routeName statis mereka
        CheckBoxTesting.routeName: (context) => const CheckBoxTesting(),
        SwitchTesting.routeName: (context) => const SwitchTesting(),
        DatePickerTest.routeName: (context) => const DatePickerTest(),
        TimePackerTesting.routeName: (context) => const TimePackerTesting(),
        DropdownTesting.routeName: (context) => const DropdownTesting(),

        // Tambahkan halaman lain di sini jika diperlukan
        // DropdownTesting.routeName: (context) => const DropdownTesting(),
      },
    );
  }
}
