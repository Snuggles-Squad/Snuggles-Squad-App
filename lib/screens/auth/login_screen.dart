import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:snuggles_squad_app/components/custom_input_decorator.dart';
import 'package:snuggles_squad_app/screens/auth/register_screen.dart';
import 'package:snuggles_squad_app/screens/dashboard_screen.dart';

import '../../services/fb_auth_service.dart';
import '../profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = "/login-screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FbAuthService fbAuthService = FbAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
            ),
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              height: 50,
              child: TextFormField(
                controller: _emailController,
                decoration:
                    CustomInputDecorator.getStandardInputDecoration(context)
                        .copyWith(labelText: "USERNAME"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration:
                    CustomInputDecorator.getStandardInputDecoration(context)
                        .copyWith(labelText: "PASSWORD"),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    minimumSize: Size.zero, // Set this
                                    padding: EdgeInsets.zero,
                                    tapTargetSize: MaterialTapTargetSize
                                        .shrinkWrap // and this
                                    ),
                                onPressed: () => Navigator.of(context)
                                    .pushNamed(RegisterScreen.routeName),
                                child: Text("CREATE ACCOUNT",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size.zero, // Set this
                                  padding: EdgeInsets.zero, // and this
                                ),
                                onPressed: () {
                                 
                                },
                                child: Text("FORGOT PASSWORD",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 12))),
                          ]),
                      SizedBox(
                        width: 30,
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                            fixedSize: Size(100, 30),
                            side: BorderSide(width: 2, color: Colors.black),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text("LOGIN",
                            style: TextStyle(
                                letterSpacing: 5,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        onPressed: () async {
                          Navigator.of(context)
                              .pushNamed(DashBoardScreen.routeName);
                          await fbAuthService
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text)
                              .then((value) {
                            if (value != null)
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Login Successfull"),
                              ));
                          });
                        },
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}

