import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sibaperr/page/dosen_list.dart';
import 'package:sibaperr/page/read_page/dosen_list_read.dart';
import 'package:sibaperr/page/intro.dart';
import 'package:sibaperr/page/login.dart';
import 'package:sibaperr/page/read_page/mhs_dosen_list_read.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  theme: ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
  ),
  debugShowCheckedModeBanner: false,
  home: const IntroPage(),
  routes: {
    '/intropage': (context) => const IntroPage(),
    '/loginpage': (context) => const LoginPage(),
    '/dosenlistpage': (context) => const DosenListPage(),
    '/dosenlistreadpage': (context) => const DosenListReadPage(),
    '/Mhsdosenlistreadpage': (context) => const MhsDosenListReadPage(),
  },
);
  }
}
