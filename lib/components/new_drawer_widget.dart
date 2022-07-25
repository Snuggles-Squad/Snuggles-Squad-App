import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snuggles_squad_app/screens/dashboard_screen.dart';
import 'package:snuggles_squad_app/screens/profile_screen.dart';
import 'package:snuggles_squad_app/screens/reflect_screen.dart';

import '../screens/new_dashboard_screen.dart';

class NewDrawerWidget extends StatefulWidget {
  const NewDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NewDrawerWidget> createState() => _NewDrawerWidgetState();
}

class _NewDrawerWidgetState extends State<NewDrawerWidget> {
  static String __currentRouteName = NewDashBoardScreen.routeName;
  final drawerItemList = [
    DrawerItem(title: "Profile", routeName: ProfileScreen.routeName),
    DrawerItem(title: "Dashboard", routeName: NewDashBoardScreen.routeName),
    DrawerItem(title: "Events", routeName: ""),
    DrawerItem(title: "Educate", routeName: ""),
    DrawerItem(title: "Reflect", routeName: RefelctScreen.routenName),
    DrawerItem(title: "Unwind", routeName: ""),
    DrawerItem(title: "Shop", routeName: ""),
    DrawerItem(title: "Buy ZZZS", routeName: "")
  ];

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    return Container(
        width: 200,
        margin: EdgeInsets.only(top: 50, bottom: 250),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            child: Drawer(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: Color.fromARGB(255, 242, 234, 250),
              child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, index) => SizedBox(
                        height: 10,
                      ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  itemCount: 8,
                  itemBuilder: (context, index) => drawerItem(
                        context,
                        drawerItemList[index],
                      )),
            )));
  }

  Widget drawerItem(BuildContext context, DrawerItem item) {
    final current = __currentRouteName == item.routeName;
    return ListTile(
        onTap: () {
          if (current || item.routeName.isEmpty) {
            Navigator.of(context).pop();
            return;
          }
          __currentRouteName = item.routeName;
          Navigator.of(context).pushReplacementNamed(item.routeName);
        },
        leading: Icon(
          Icons.person_outline,
          color: Colors.black,
        ),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ));
  }
}

class DrawerItem {
  final String title;
  final String routeName;

  DrawerItem({required this.title, required this.routeName});
}
