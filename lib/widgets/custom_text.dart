import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Font Plus Jakarta Sans dipilih karena memiliki keterbacaan tinggi dan memberikan kesan modern serta bersih pada antarmuka daftar menu kantin.
// Kombinasi parameter ukuran, ketebalan, dan warna dirancang fleksibel agar mudah membedakan hierarki visual antara judul utama, nama hidangan, dan label harga.
// Gaya tampilan minimalis dengan kontras warna hangat (deep orange/slate) diterapkan agar pengguna dapat memindai daftar menu dan harga secara cepat.
class TeksKantin extends StatelessWidget {
  final String isiTeks;
  final double ukuran;
  final FontWeight ketebalan;
  final Color warna;

  const TeksKantin({
    super.key,
    required this.isiTeks,
    this.ukuran = 14.0,
    this.ketebalan = FontWeight.normal,
    this.warna = const Color(0xFF1E293B),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      isiTeks,
      style: GoogleFonts.plusJakartaSans(
        fontSize: ukuran,
        fontWeight: ketebalan,
        color: warna,
      ),
    );
  }
}