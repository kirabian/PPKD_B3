import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas11/preference/shared_preference.dart';
import 'package:ppkdb3/tugas_6/tugas6.dart';

class LogOutButton extends StatelessWidget {
  static const String routeName = '/logout';
  const LogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        PreferenceHandler.removeLogin();
        Navigator.pushReplacementNamed(context, WattpadClone.routeName);
      },
      child: Text("Keluar"),
    );
  }
}
