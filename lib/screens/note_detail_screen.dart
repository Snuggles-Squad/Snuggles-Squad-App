import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snuggles_squad_app/components/drawer_widget.dart';
import 'package:snuggles_squad_app/screens/recordings_detail_screen.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/note-detail";
  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  final String s =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse mollis consequat molestie. Fusce mattis arcu urna, et malesuada sapien condimentum convallis. Aenean scelerisque orci id tellus maximus, at tempor ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          leading: GestureDetector(
              // onTap: () =>
              //     Navigator.of(context).pushNamed(DashBoardScreen.routeName),
              child: Image.asset(
            "assets/images/ss1.png",
          )),
          backgroundColor: Colors.black,
          title: Text(
            "REFLECT",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 5,
                fontStyle: FontStyle.italic),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (!_scaffoldKey.currentState!.isDrawerOpen) {
                    _scaffoldKey.currentState?.openDrawer();
                  } else {
                    _scaffoldKey.currentState?.openEndDrawer();
                  }
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 50,
                )),
          ],
        ),
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "NOTE",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                        letterSpacing: 5),
                  )),
              Expanded(
                  child: GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(RecordingsDetailScreen.routeName),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        color: Colors.black,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.white,
                                )),
                            Text("03/04/2022",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    letterSpacing: 5)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("BUY HIGH SELL LOW PRO",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    letterSpacing: 5)),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              s.toUpperCase(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  height: 2,
                                  wordSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 5),
                            ),
                            Expanded(child: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  child: Text("EDIT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 5)),
                                ),
                                SizedBox(width: 20),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  child: Text("DELETE",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          letterSpacing: 5)),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )))
            ],
          ),
        ));
  }
}
