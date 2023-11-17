import 'package:amazon/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return  SafeArea(
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(width * 1, height * 0.08),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.012),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: appBarGradientColor, begin: Alignment.centerLeft, end: Alignment.centerRight)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                SizedBox(
                  width: width * 0.87,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Amazon.In',
                        fillColor: white, filled: true,
                        prefixIcon: IconButton(onPressed: (){},icon: Icon(Icons.search), color: black,),
                        suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.camera), color: grey,),
                        contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: grey))),

                    )), Icon(Icons.mic)
              ],),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: addressBarGradientColor, begin: Alignment.centerLeft, end: Alignment.centerRight)
                ),
              )
            ],
          ),

        )),
    );
  }
}
