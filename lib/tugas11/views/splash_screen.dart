import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/preference/shared_preference.dart';
import 'package:ppkdb3/tugas11/utils/app_image.dart';
import 'package:ppkdb3/tugas_6/main_page.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

class Day16SplashScreen extends StatefulWidget {
  const Day16SplashScreen({super.key});

  static const routeName = "/splash_screen"; // ✅ routeName konsisten

  @override
  State<Day16SplashScreen> createState() => _Day16SplashScreenState();
}

class _Day16SplashScreenState extends State<Day16SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  void _checkLogin() async {
    bool? isLogin = await PreferenceHandler.getLogin();

    // Tunggu 3 detik sebelum pindah halaman
    Future.delayed(const Duration(seconds: 3), () {
      if (isLogin == true) {
        Navigator.pushReplacementNamed(context, MainPage.routeName);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WattpadClone()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.bukukita, width: 150),
            const SizedBox(height: 20),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
