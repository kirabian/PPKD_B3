import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ppkdb3/tugas11/preference/shared_preference.dart';
import 'package:ppkdb3/tugas14/api/endpoint/endpoint.dart';
import 'package:ppkdb3/tugas14/model/get_user_model.dart';
import 'package:ppkdb3/tugas14/model/register_model.dart';

class AuthenticationAPI {
  /// Register User
  static Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    final url = Uri.parse(Endpoint.register);
    final response = await http.post(
      url,
      body: {"name": name, "email": email, "password": password},
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return RegisterUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Register gagal");
    }
  }

  /// Login User
  static Future<RegisterUserModel> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse(Endpoint.login);
    final response = await http.post(
      url,
      body: {"email": email, "password": password},
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final data = RegisterUserModel.fromJson(json.decode(response.body));

      // Simpan token ke SharedPreferences
      if (data.token != null) {
        await PreferenceHandler.saveToken(data.token!);
        await PreferenceHandler.saveLogin();
      }

      return data;
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Login gagal");
    }
  }

  /// Update User Profile
  static Future<GetUserModel> updateUser({
    required String name,
    required String email,
  }) async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();

    final response = await http.put(
      // biasanya pakai PUT / PATCH
      url,
      body: {"name": name, "email": email},
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token ?? ""}",
      },
    );

    if (response.statusCode == 200) {
      return GetUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Update gagal");
    }
  }

  /// Get Profile User
  static Future<GetUserModel> getProfile() async {
    final url = Uri.parse(Endpoint.profile);
    final token = await PreferenceHandler.getToken();

    final response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer ${token ?? ""}",
      },
    );

    if (response.statusCode == 200) {
      return GetUserModel.fromJson(json.decode(response.body));
    } else {
      final error = json.decode(response.body);
      throw Exception(error["message"] ?? "Ambil profile gagal");
    }
  }

  static Future<Map<String, dynamic>> updateProfile(
    String newName,
    String newEmail,
  ) async {
    final token = await PreferenceHandler.getToken();

    final response = await http.put(
      Uri.parse(Endpoint.profile),
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
      body: {'name': newName, 'email': newEmail},
    );

    if (response.statusCode == 200) {
      return {'success': true, 'data': jsonDecode(response.body)};
    } else {
      return {
        'success': false,
        'error': "Gagal memperbarui profil (code: ${response.statusCode})",
      };
    }
  }

  /// Logout user (hapus token & status login)
  static Future<void> logout() async {
    await PreferenceHandler.removeLogin();
    await PreferenceHandler.removeToken();
  }
}
