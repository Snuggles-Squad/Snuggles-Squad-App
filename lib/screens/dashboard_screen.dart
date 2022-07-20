import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  static const routeName = "/dashboard-screen";
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final listItems = ["EDUCATE", "REFLECT", "UNWIND", "DREAM", "SHOP"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Image.asset(
            "assets/images/ss1.png",
          ),
          backgroundColor: Colors.black,
          title: Text(
            "DASHBOARD",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 5,
                fontStyle: FontStyle.italic),
          ),
          actions: [
            Icon(
              Icons.menu,
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("WELCOME BACK CHET!",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 5,
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.italic)),
                SizedBox(
                  height: 20,
                ),
                Directionality(
                    textDirection: TextDirection.rtl,
                    child: Expanded(
                        child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.7,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                buildGridItem(listItems[index])))),
              ]),
        )));
  }

  Widget buildGridItem(String title) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.circular(10)),
        child: Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 5,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic)),
            )));
  }
}
