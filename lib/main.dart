import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:snuggles_squad_app/screens/auth/login_screen.dart';
import 'package:snuggles_squad_app/screens/auth/register_screen.dart';
import 'package:snuggles_squad_app/screens/dashboard_screen.dart';
import 'package:snuggles_squad_app/screens/new_dashboard_screen.dart';
import 'package:snuggles_squad_app/screens/note_detail_screen.dart';
import 'package:snuggles_squad_app/screens/profile_screen.dart';
import 'package:snuggles_squad_app/screens/recordings_detail_screen.dart';
import 'package:snuggles_squad_app/screens/reflect_screen.dart';
import 'package:snuggles_squad_app/screens/sign_in_screen.dart';
import 'package:snuggles_squad_app/screens/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: SignInScreen.routeName,
      theme: ThemeData(
          fontFamily: 'Satoshi', scaffoldBackgroundColor: Colors.white),
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
        DashBoardScreen.routeName: (context) => DashBoardScreen(),
        RefelctScreen.routenName: (context) => RefelctScreen(),
        NoteDetailScreen.routeName: (context) => NoteDetailScreen(),
        RecordingsDetailScreen.routeName: (context) => RecordingsDetailScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
        SignInScreen.routeName: (context) => SignInScreen(),
        NewDashBoardScreen.routeName: (context) => NewDashBoardScreen(),
      },
    );
  }
}
