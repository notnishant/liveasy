import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/homeScreen/home_page.dart';
import 'package:flutter_application_1/homeScreen/otp_screen.dart';
import 'package:flutter_application_1/homeScreen/phone_number.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'homeScreen/profile.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/lib/homeScreen/profile.dart': (context) => Profile(),
        '/lib/homeScreen/home_page.dart': (context) => HomePage(),
        '/lib/homeScreen/phone_number.dart': (context) => PhoneNumber(),
        '/lib/homeScreen/otp_screen.dart': (context) => OtpScreen(),
      },
      home: HomePage(),
    );
  }
}
