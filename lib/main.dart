import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'page/header_footer/navbar_container.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const NavbarContainer(),
    ),
  );
}
