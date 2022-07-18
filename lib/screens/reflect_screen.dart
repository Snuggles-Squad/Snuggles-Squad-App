import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReflectScreen extends StatefulWidget {
  const ReflectScreen({Key? key}) : super(key: key);
  static const routeName = "/reflect-screen";
  @override
  State<ReflectScreen> createState() => _ReflectScreenState();
}

class _ReflectScreenState extends State<ReflectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            "REFLECT",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "RECORDING",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, index) => Container())),
              ElevatedButton(onPressed: () {}, child: Text("DELETE"))
            ],
          ),
        ));
  }
}
