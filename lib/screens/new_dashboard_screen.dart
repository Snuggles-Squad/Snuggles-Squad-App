import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:snuggles_squad_app/components/new_drawer_widget.dart';

class NewDashBoardScreen extends StatefulWidget {
  const NewDashBoardScreen({Key? key}) : super(key: key);
  static const routeName = "/new-dash";
  @override
  State<NewDashBoardScreen> createState() => _NewDashBoardScreenState();
}

class _NewDashBoardScreenState extends State<NewDashBoardScreen> {
  final gridItems = [
    {
      "imagePath": "assets/images/Dream.png",
      "name": "Dream",
      "color": Color.fromARGB(255, 62, 165, 198)
    },
    {
      "imagePath": "assets/images/Educate.png",
      "name": "Educate",
      "color": Color.fromARGB(255, 74, 188, 168)
    },
    {
      "imagePath": "assets/images/Reflect.png",
      "name": "Reflect",
      "color": Color.fromARGB(255, 255, 149, 89)
    },
    {
      "imagePath": "assets/images/Unwind.png",
      "name": "Unwind",
      "color": Color.fromARGB(255, 251, 205, 124)
    },
    {
      "imagePath": "assets/images/Shop.png",
      "name": "Shop",
      "color": Color.fromARGB(255, 134, 182, 96)
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        leadingWidth: 0,
        title: Text(
          "snuggles",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 131, 46, 208),
          ),
        ),
        actions: [
          Builder(
            builder: ((context) {
              Padding(padding: EdgeInsets.all(10));
              return IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  icon: Icon(
                    FontAwesome5.bars,
                    color: Colors.black,
                  ));
            }),
          ),
        ],
      ),
      endDrawer: NewDrawerWidget(),
      body: Column(
        children: [
          Text("welcome back chet!",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              )),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => index == 5
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              FontAwesome5.arrow_right,
                              size: 20,
                            )
                          ],
                        )
                      : buildGridItem(gridItems[index])))
        ],
      ),
    );
  }

  Widget buildGridItem(Map item) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: item["color"]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Image.asset(
              item["imagePath"],
              width: 200,
              height: 150,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    FontAwesome5.arrow_right,
                    color: Colors.white,
                    size: 20,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
