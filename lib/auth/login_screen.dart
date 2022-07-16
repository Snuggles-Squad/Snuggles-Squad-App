import 'package:flutter/material.dart';
import 'package:snuggles_squad_app/auth/register_screen.dart';
import 'package:snuggles_squad_app/components/custom_input_decorator.dart';

import '../services/fb_auth_service.dart';

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
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              height: 50,
              child: TextFormField(
                controller: _emailController,
                showCursor: false,
                decoration:
                    CustomInputDecorator.getStandardInputDecoration(context)
                        .copyWith(hintText: "USERNAME"),
              ),
            ),
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.7,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                showCursor: false,
                decoration:
                    CustomInputDecorator.getStandardInputDecoration(context)
                        .copyWith(hintText: "PASSWORD"),
              ),
            ),
            SizedBox(height: 30.0),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Align(
                    alignment: Alignment.center,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          fixedSize: Size(100, 50),
                          shape: StadiumBorder(side: BorderSide(width: 2))),
                      child: Text("Login",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                      onPressed: () async {
                        await fbAuthService.signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                    ))),
            const SizedBox(height: 30.0),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegisterScreen.routeName);
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}
