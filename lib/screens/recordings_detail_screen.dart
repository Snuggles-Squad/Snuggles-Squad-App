import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snuggles_squad_app/components/drawer_widget.dart';

class RecordingsDetailScreen extends StatefulWidget {
  const RecordingsDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/recording-detail";
  @override
  State<RecordingsDetailScreen> createState() => _RecordingsDetailScreenState();
}

class _RecordingsDetailScreenState extends State<RecordingsDetailScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
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
        children: [
          SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Text(
                "RECORDING",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    letterSpacing: 5),
              )),
          Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ])),
          SizedBox(
            height: 20,
          ),
          ListTile(
              visualDensity: VisualDensity(vertical: -4),
              leading: Icon(
                Icons.pause_circle,
                color: Colors.black,
                size: 40,
              ),
              title: Stack(children: [
                Divider(
                  thickness: 3,
                  color: Colors.black,
                ),
                Positioned(
                    left: 50,
                    child: Container(
                      height: 20,
                      width: 2,
                      color: Colors.black,
                    ))
              ])),
          Align(
            alignment: Alignment.centerRight,
            child: Text("03:34",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("DELETE",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 5)),
          ),
        ],
      )),
    );
  }
}
