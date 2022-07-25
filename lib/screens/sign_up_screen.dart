import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:snuggles_squad_app/components/custom_input_decorator.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../services/fb_auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const routeName = "/sign-up-screen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController(),
      _cPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = false, _obscureText1 = false;
  final FbAuthService fbAuthService = FbAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: formKey,
                child: Center(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: SizedBox()),
                    Text("Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30)),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Text(
                          "Create an account at The Snuggle Squad",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration:
                          CustomInputDecorator.getInputDecoration(context)
                              .copyWith(hintText: "Email address"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: _obscureText,
                      controller: _passwordController,
                      decoration:
                          CustomInputDecorator.getInputDecoration(context)
                              .copyWith(
                        hintText: "Enter password",
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(
                            _obscureText
                                ? FontAwesome5.eye_slash
                                : FontAwesome5.eye,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: _obscureText1,
                      controller: _cPasswordController,
                      decoration:
                          CustomInputDecorator.getInputDecoration(context)
                              .copyWith(
                        hintText: "Confirm Password",
                        suffixIcon: IconButton(
                          onPressed: _toggle1,
                          icon: Icon(
                            _obscureText1
                                ? FontAwesome5.eye_slash
                                : FontAwesome5.eye,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w500),
                                text: "Already have an account? ",
                                children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).pop();
                                },
                              text: "Sign in",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 131, 46, 208),
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold))
                        ]))),
                    Expanded(flex: 2, child: SizedBox()),
                    Center(
                        child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 131, 46, 208),
                          fixedSize: Size(250, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () async {
                        await fbAuthService
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Registration Successfull"),
                                )));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    SizedBox(height: 20),
                  ],
                )))));
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggle1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }
}
