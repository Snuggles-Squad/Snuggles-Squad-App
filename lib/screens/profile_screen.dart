import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = "/profile-screen";
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            "PROFILE",
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
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "MANAGE ACCOUNT",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  )),
              ListTile(
                  leading: Container(
                    width: 50,
                    height: 200,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: Text(
                    "CHET SUMBERLAND\nZzzs:2342",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "12 FAVORITES  |  34 FOLLOWERS",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  )),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(color: Colors.black),
                child: Center(
                  child: Text(
                    "FAVORITES",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 5),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => listItem()))
            ],
          ),
        ));
  }

  Widget listItem() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(color: Colors.grey[300]),
          child: ListTile(
            visualDensity: VisualDensity(horizontal: 0, vertical: -3),
            minVerticalPadding: 10,
            leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.play_arrow_sharp,
                  color: Colors.white,
                )),
            title: Text(
              "FINDING YOUR INNER SNUGGLE",
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2),
            ),
            subtitle: Text("HOST: CRET                 BINARUAL BEATS"),
          ),
        ),
        Align(alignment: Alignment.topRight, child: Icon(Icons.cancel_outlined))
      ],
    );
  }
}
