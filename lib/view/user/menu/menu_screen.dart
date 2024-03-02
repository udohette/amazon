

import 'package:amazon/constant/common_function.dart';
import 'package:amazon/utils/colors.dart';
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
        // height: height,
        width: width,
        padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.03),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: appBarGradientColor, begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(5),
              //height:  height * 0.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: greyShade3),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: Colors.amberAccent.shade400
                          ),
                        ),
                      ),
                      CommonFunctions.blankSpace(0, width * 0.02),

                      Expanded(
                        flex: 2,
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                              color: Colors.amber.shade100
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    Text('Amazon Pay', style: textTheme.bodyMedium,),
                    Text('Amazon miniTV',style: textTheme.bodyMedium,),
                  ],),
                ],
              ),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 18,
                gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                childAspectRatio: 0.7),
                itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assests/images/menu_pics/$index.png'), fit: BoxFit.contain),
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: greyShade3)
                    ),
                  );
                }),
            CommonFunctions.blankSpace(height * 0.02, 0),
            Column(children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: white,
                      minimumSize: Size(width, height * 0.06)
                  ),
                  onPressed: (){}, child: Row(children: [
                Text('Settings',style: textTheme.headlineSmall?.copyWith(color: grey)),
                Spacer(),
                Icon(Icons.chevron_right, color: Colors.grey, size: 20,)
              ],)),
              CommonFunctions.blankSpace(height * 0.01, 0),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      backgroundColor: white,
                      minimumSize: Size(width, height * 0.06)
                  ),
                  onPressed: (){}, child: Row(children: [
                Text('Customer Service',style: textTheme.headlineSmall?.copyWith(color: Colors.grey)),
                Spacer(),
                Icon(Icons.chevron_right, color: Colors.grey, size: 20,)
              ],)),
            ],)
            // ListView.builder(
            //   itemCount: 2,
            //   shrinkWrap: true,
            //     itemBuilder: (context, index){
            //   return  Container(
            //     margin: EdgeInsets.symmetric(vertical: height * 0.005),
            //       padding: EdgeInsets.symmetric(vertical: height * 0.050, horizontal: width * 0.03),
            //       height: height * 0.06,
            //       width: width,
            //       decoration: BoxDecoration(
            //         color: white,
            //         border: Border.all(color: teal),
            //         borderRadius: BorderRadius.circular(7)
            //       ),
            //       child: Center(child: Text( index == 0 ? 'Hello':'Hi',style: textTheme.headlineMedium?.copyWith(color: Colors.black),)),alignment: Alignment.center,);
            // })
          ],),
        ),
      ),
    )
    );
  }
}
