import 'package:flutter/material.dart';
import 'package:snuggles_squad_app/services/fb_auth_service.dart';

import '../../components/custom_input_decorator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static const routeName = "/register-screen";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  fixedSize: Size(150, 30),
                  side: BorderSide(width: 2, color: Colors.black),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text("REGISTER",
                  style: TextStyle(
                      letterSpacing: 5,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              onPressed: () async {
                await fbAuthService
                    .signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text)
                    .then((value) =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Registration Successfull"),
                        )));
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero, // Set this
                  padding: EdgeInsets.zero, // and this
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Already Have Account? Login",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
