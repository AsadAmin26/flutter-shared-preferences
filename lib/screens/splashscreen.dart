// ignore_for_file: sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref/screens/adminscreen.dart';
import 'package:shared_pref/screens/loginscreen.dart';
import 'package:shared_pref/screens/studentscreen.dart';
import 'package:shared_pref/screens/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String role = sp.getString('role') ?? '';

    if (isLogin) {
      if (role == 'Teacher') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const TeacherScreen())));
        });
      } else if (role == 'Admin') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AdminScreen())));
        });
      } else if (role == 'Student') {
        Timer(const Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const StudentScreen())));
        });
      }
    } else {
      Timer(const Duration(seconds: 5), () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => const LoginScreen())));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Image.network(
          fit: BoxFit.fitHeight,
          'https://images.pexels.com/photos/267569/pexels-photo-267569.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
    );
  }
}
