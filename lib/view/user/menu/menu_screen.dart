import 'package:amazon/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(child: Scaffold(
      appBar:  PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height)),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.03),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBarGradientColor, begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: Column(children: [
          Container(
            height:  height * 0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: greyShade3),
            ),
          )
        ],),
      ),
    )
    );
  }
}
