// ignore_for_file: sized_box_for_whitespace, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_pref/screens/adminscreen.dart';
import 'package:shared_pref/screens/studentscreen.dart';
import 'package:shared_pref/screens/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // @override
  // void initState() {

  //   super.initState();
  // }
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();
  String dropdownvalue = 'Teacher';
  var items = [
    'Teacher',
    'Admin',
    'Student',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: namecontroller,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailcontroller,
              decoration: const InputDecoration(hintText: 'Email'),
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
                isExpanded: true,
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                }),
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
                      sp.setString('name', namecontroller.toString());
                      sp.setString('email', emailcontroller.toString());
                      sp.setString('role', dropdownvalue.toString());
                      sp.setBool('isLogin', true);
                      if (dropdownvalue == 'Teacher') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherScreen()));
                      } else if (dropdownvalue == 'Admin') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminScreen()));
                      } else if (dropdownvalue == 'Student') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black),
                    ))),
          ],
        ),
      ),
    );
  }
}
