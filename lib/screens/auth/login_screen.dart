import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/menu_model.dart';
import '../../../widgets/custom_text.dart';
import '../menu/menu_list_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'admin@untirta.ac.id');
  final _passwordController = TextEditingController(text: '123456');
  String? _pesanError;

  void _prosesLogin() {
    if (_formKey.currentState!.validate()) {
      final berhasil = AuthRepository.login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (berhasil) {
        setState(() => _pesanError = null);
        Get.to(() => const MenuListScreen());
      } else {
        setState(() => _pesanError = 'Email atau password tidak sesuai.');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 101, 176),
        title: const TeksKantin(
          isiTeks: 'SweetieBite Login',
          ukuran: 18,
          ketebalan: FontWeight.bold,
          warna: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.storefront_rounded,
                size: 72,
                color: Color.fromARGB(255, 238, 101, 176),
              ),
              const SizedBox(height: 12),
              const Center(
                child: TeksKantin(
                  isiTeks: 'Selamat Datang di SweetieBite!',
                  ukuran: 18,
                  ketebalan: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              if (_pesanError != null) ...[
                TeksKantin(
                  isiTeks: _pesanError!,
                  ukuran: 13,
                  ketebalan: FontWeight.w600,
                  warna: Colors.pink,
                ),
                const SizedBox(height: 12),
              ],
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Email wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Password wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 238, 101, 176),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _prosesLogin,
                child: const TeksKantin(
                  isiTeks: 'Masuk',
                  ukuran: 16,
                  ketebalan: FontWeight.bold,
                  warna: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Get.to(() => const RegisterScreen()),
                child: const TeksKantin(
                  isiTeks: 'Belum punya akun? Daftar di sini',
                  ukuran: 14,
                  ketebalan: FontWeight.w600,
                  warna: Color.fromARGB(255, 238, 101, 176),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}