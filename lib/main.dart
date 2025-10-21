import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/view/terminal_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brasil, 2097',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        fontFamily: GoogleFonts.robotoMono().fontFamily,
      ),
      home: TerminalView(),
    );
  }
}
