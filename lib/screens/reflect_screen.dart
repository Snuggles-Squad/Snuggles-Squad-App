import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snuggles_squad_app/components/drawer_widget.dart';
import 'package:snuggles_squad_app/screens/note_detail_screen.dart';

class RefelctScreen extends StatefulWidget {
  const RefelctScreen({Key? key}) : super(key: key);
  static const routenName = "/reflect-screen";
  @override
  State<RefelctScreen> createState() => _RefelctScreenState();
}

class _RefelctScreenState extends State<RefelctScreen> {
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
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2)),
                  child: Text("ALL"),
                ),
                Text("NOTES"),
                Text("RECORDINGS"),
              ],
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => listItem()))
          ]),
        ));
  }

  Widget listItem() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: ListTile(
            onTap: () =>
                Navigator.of(context).pushNamed(NoteDetailScreen.routeName),
            visualDensity: VisualDensity(horizontal: 0, vertical: -3),
            minVerticalPadding: 10,
            title: Text(
              "DREAM JOURNAL",
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  letterSpacing: 2),
            ),
            subtitle: Text("17 NOTES      31 RECORDINGS",
                style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2)),
          ),
        ),
        Align(alignment: Alignment.topRight, child: Icon(Icons.cancel_outlined))
      ],
    );
  }
}
