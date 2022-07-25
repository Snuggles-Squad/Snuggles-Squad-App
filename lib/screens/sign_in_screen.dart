import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:snuggles_squad_app/screens/sign_up_screen.dart';
import '../components/custom_input_decorator.dart';
import '../services/fb_auth_service.dart';
import 'new_dashboard_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static const routeName = "/sign-in";
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController(),
      _passwordController = TextEditingController();
  final FbAuthService fbAuthService = FbAuthService();
  final formKey = GlobalKey<FormState>();
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 3, child: SizedBox()),
                    Text("Sign in",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30)),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 50),
                        child: Text(
                          "Welcome back to The Snuggle Squad",
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration:
                          CustomInputDecorator.getInputDecoration(context)
                              .copyWith(hintText: "Username"),
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
                    Row(children: [
                      Expanded(child: SizedBox()),
                      Text(
                        "Forgot Password",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ]),
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w500),
                                text: "Create an account? ",
                                children: [
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context)
                                      .pushNamed(SignUpScreen.routeName);
                                },
                              text: "Sign up",
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
                        Navigator.of(context)
                            .pushNamed(NewDashBoardScreen.routeName);
                        await fbAuthService
                            .signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text)
                            .then((value) {
                          if (value != null)
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Login Successfull"),
                            ));
                        });
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                    SizedBox(height: 20),
                  ],
                ))));
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
