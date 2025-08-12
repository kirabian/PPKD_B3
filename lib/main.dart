import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdb3/tugas9/bukulist.dart';
import 'package:ppkdb3/tugas9/bukumap.dart';
import 'package:ppkdb3/tugas9/modelcallsbuku.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/main_page.dart'; // DIUBAH: Impor MainPage
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart'; // Halaman Login (WattpadClone)

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

      // Tentukan halaman awal aplikasi.
      initialRoute: '/',

      // Daftarkan semua rute (halaman) aplikasi di sini.
      routes: {
        // Rute untuk halaman Login
        '/': (context) => const WattpadClone(),

        // DIUBAH: Rute untuk MainPage (halaman utama setelah login).
        // Ini akan mengambil argumen (userData) yang dikirim dari halaman login.
        MainPage.routeName: (context) {
          final args =
              ModalRoute.of(context)!.settings.arguments as Map<String, String>;
          return MainPage(userData: args);
        },

        // Daftarkan halaman lain dari drawer menggunakan routeName statis mereka
        // agar navigasi dari AppDrawer berfungsi.
        CheckBoxTesting.routeName: (context) => const CheckBoxTesting(),
        SwitchTesting.routeName: (context) => const SwitchTesting(),
        DatePickerTest.routeName: (context) => const DatePickerTest(),
        TimePackerTesting.routeName: (context) => const TimePackerTesting(),
        DropdownTesting.routeName: (context) => const DropdownTesting(),
        BukuMap.routeName: (context) => const BukuMap(),
        BukuList.routeName: (context) => const BukuList(),
        ModelBuku.routeName: (context) => const ModelBuku(),

        // Tambahkan halaman lain di sini jika diperlukan
      },
    );
  }
}
