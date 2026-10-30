import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const AplikasiKantin());
}

class AplikasiKantin extends StatelessWidget {
  const AplikasiKantin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'sweetiebite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 238, 101, 176)),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}