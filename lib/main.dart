import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:ppkdb3/tugas10/peminjamanbuku.dart';
import 'package:ppkdb3/tugas11/views/CatatanTugasSekolah/index_catatan.dart';
import 'package:ppkdb3/tugas11/views/register_screen.dart';
import 'package:ppkdb3/tugas11/views/splash_screen.dart';
import 'package:ppkdb3/tugas11/views/user_screen.dart';
import 'package:ppkdb3/tugas9/bukulist.dart';
import 'package:ppkdb3/tugas9/bukumap.dart';
import 'package:ppkdb3/tugas9/modelcallsbuku.dart';
import 'package:ppkdb3/tugas_6/checkbox.dart';
import 'package:ppkdb3/tugas_6/datepicker.dart';
import 'package:ppkdb3/tugas_6/dropdown.dart';
import 'package:ppkdb3/tugas_6/main_page.dart';
import 'package:ppkdb3/tugas_6/switch.dart';
import 'package:ppkdb3/tugas_6/timepacker.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

void main() {
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

      // Halaman pertama: Splash Screen
      initialRoute: Day16SplashScreen.routeName,

      routes: {
        Day16SplashScreen.routeName: (context) => const Day16SplashScreen(),
        '/login': (context) => const WattpadClone(),
        MainPage.routeName: (context) => const MainPage(),
        CheckBoxTesting.routeName: (context) => const CheckBoxTesting(),
        SwitchTesting.routeName: (context) => const SwitchTesting(),
        DatePickerTest.routeName: (context) => const DatePickerTest(),
        TimePackerTesting.routeName: (context) => const TimePackerTesting(),
        DropdownTesting.routeName: (context) => const DropdownTesting(),
        BukuMap.routeName: (context) => const BukuMap(),
        BukuList.routeName: (context) => const BukuList(),
        ModelBuku.routeName: (context) => const ModelBuku(),
        PeminjamanBuku.routeName: (context) => const PeminjamanBuku(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        UserScreen.routeName: (context) => const UserScreen(),
        CatatanScreen.routeName: (context) => const CatatanScreen(),
      },
    );
  }
}
