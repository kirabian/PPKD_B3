import 'package:flutter/material.dart';
import 'package:ppkdb3/tugas14/api/register_user.dart'; // Pastikan import ini

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  String? name;
  String? email;
  String? created_at;
  String? errorMessage;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      final userProfile = await AuthenticationAPI.getProfile();

      setState(() {
        name = userProfile.data.name ?? "Nama tidak ditemukan";
        email = userProfile.data.email ?? "Email tidak ditemukan";
        created_at = (userProfile.data.createdAt ?? "").toString();
        errorMessage = null;
      });
    } catch (e) {
      setState(() {
        errorMessage = "Terjadi error: $e";
      });
    }
  }

  void _showEditDialog() {
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profil'),
          content: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Batal'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (nameController.text.isNotEmpty ||
                            emailController.text.isEmpty) {
                          setState(() {
                            _isLoading = true;
                          });

                          try {
                            final result =
                                await AuthenticationAPI.updateProfile(
                                  nameController.text,
                                  emailController.text,
                                );

                            if (result['success'] == true) {
                              final data = result['data'];
                              setState(() {
                                name = data['name'] ?? nameController.text;
                                email = data['email'] ?? emailController.text;
                                errorMessage = null;
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profil berhasil diperbarui'),
                                ),
                              );
                            } else {
                              setState(() {
                                errorMessage = result['error'];
                              });
                            }
                          } catch (e) {
                            setState(() {
                              errorMessage = "Terjadi error: $e";
                            });
                          } finally {
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Selamat Datang di Dashboard!",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          if (errorMessage != null) ...[
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
          ] else if (name != null && email != null) ...[
            Text("Nama: $name", style: const TextStyle(color: Colors.white)),
            Text("Email: $email", style: const TextStyle(color: Colors.white)),
            Text(
              "Dibuat: $created_at",
              style: const TextStyle(color: Colors.white),
            ),
          ] else ...[
            const CircularProgressIndicator(),
          ],
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _showEditDialog, child: const Text("Edit")),
          ElevatedButton(
            onPressed: () async {
              await AuthenticationAPI.logout();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
            child: const Text("Keluar"),
          ),
        ],
      ),
    );
  }
}
