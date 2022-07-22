import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:snuggles_squad_app/screens/dashboard_screen.dart';
import 'package:snuggles_squad_app/screens/profile_screen.dart';
import 'package:snuggles_squad_app/screens/reflect_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  static String __currentRouteName = DashBoardScreen.routeName;
  final drawerItemList = [
    DrawerItem(title: "PROFILE", routeName: ProfileScreen.routeName),
    DrawerItem(title: "DASHBOARD", routeName: DashBoardScreen.routeName),
    DrawerItem(title: "EDUCATE", routeName: ""),
    DrawerItem(title: "UPCOMING EVENTS", routeName: ""),
    DrawerItem(title: "REFLECT", routeName: RefelctScreen.routenName),
    DrawerItem(title: "UNWIND", routeName: ""),
    DrawerItem(title: "SHOP", routeName: ""),
    DrawerItem(title: "BUY ZZZS", routeName: "")
  ];

  @override
  Widget build(BuildContext context) {
    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;
    return Container(
        margin: EdgeInsets.only(
            top: statusBarHeight +
                appBarHeight), //adding one pixel for appbar shadow

        child: Drawer(
          backgroundColor: Colors.grey[900],
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              separatorBuilder: (_, index) => SizedBox(
                    height: index == 2
                        ? 60
                        : index == 6
                            ? 60
                            : 20,
                  ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: 8,
              itemBuilder: (context, index) => drawerItem(
                    context,
                    drawerItemList[index],
                  )),
        ));
  }

  Widget drawerItem(BuildContext context, DrawerItem item) {
    final current = __currentRouteName == item.routeName;
    return GestureDetector(
        onTap: () {
          if (__currentRouteName == item.routeName || item.routeName.isEmpty) {
            Navigator.of(context).pop();
            return;
          }
          __currentRouteName = item.routeName;
          Navigator.of(context).pushReplacementNamed(item.routeName);
        },
        child: Container(
            decoration: BoxDecoration(
              color: current ? Colors.grey : Colors.grey[900],
              borderRadius: BorderRadius.circular(5),
            ),
            padding: current
                ? EdgeInsets.symmetric(vertical: 15, horizontal: 10)
                : EdgeInsets.zero,
            child: Text(
              item.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white,
                  letterSpacing: 5,
                  fontStyle: FontStyle.italic),
            )));
  }
}

class DrawerItem {
  final String title;
  final String routeName;

  DrawerItem({required this.title, required this.routeName});
}
