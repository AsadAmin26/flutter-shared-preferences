// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_pref/screens/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Students',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                      onPressed: () async {
                        SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.clear();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.black),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
