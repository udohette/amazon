import 'dart:developer';

import 'package:amazon/constant/common_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../home/home_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar:  PreferredSize(
            preferredSize: Size(width * 1, height * 0.08),
            child: HomePageAppBar(width: width, height: height)),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              RichText(text: TextSpan(children: [
                TextSpan(text: 'Subtotal ', style: textTheme.headlineSmall),
                TextSpan(text: 'N6545.00', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold))
              ])),
                CommonFunctions.blankSpace(height * 0.01, 0),
                SizedBox(
                  height: height * 0.06,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Icon(Icons.check_circle, color: teal,),
                      CommonFunctions.blankSpace(0, width * 0.01),
                    Expanded(
                      child: Column(children: [
                        RichText(
                          textAlign: TextAlign.justify,
                            text: TextSpan(children: [
                          TextSpan(text: 'Select this Option at checkout. ', style: textTheme.bodyLarge?.copyWith(color: teal)),
                          TextSpan(text: 'Your Order is Eligible for FREE Delivery ', style: textTheme.bodyLarge?.copyWith(color: black)),
                          TextSpan(text: 'Details', style: textTheme.bodyLarge?.copyWith(color: teal)),
                        ])),

                        //TextButton(onPressed: (){}, child:  RichText(text: TextSpan(text: 'Details', style: textTheme.bodyLarge?.copyWith(color: teal))))
                      ],),
                    )
                  ],),
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        backgroundColor: amber,
                      minimumSize: Size(width, height * 0.06)
                    ),
                      onPressed: (){}, child: Text('Proceed to  Buy',style: textTheme.bodyMedium,)),
                ),
                CommonFunctions.blankSpace( height * 0.02, 0),
                Row(children: [
                  Icon(Icons.check_box_outline_blank, size: 35,),
                  CommonFunctions.blankSpace( 0, width * 0.02),
                  Text('Send as gift. Include custom message', style: textTheme.headlineSmall,)
                ],),
                CommonFunctions.blankSpace( height * 0.02, 0),
                CommonFunctions.divider(),
                CommonFunctions.blankSpace( height * 0.02, 0),
                ListView.builder(scrollDirection: Axis.vertical, itemCount: 2,shrinkWrap: true, itemBuilder: (context, index){
                  return Container(
                    height: height * 0.3,
                    width: width,
                    margin: EdgeInsets.symmetric(vertical: height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyShade1
                    ),
                    child: Row(children: 
                    [Expanded(flex:4, 
                      child: Column(children: [
                      Image(image: AssetImage("assests/images/todays_deals/todaysDeal1.png"), fit: BoxFit.fitWidth,),
                        Container(
                          height:  height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3)
                          ),)
                    ],),
                    ),
                      Expanded(flex: 6, child: Column())
                    ],
                    ),
                  );
                })
            ],),
          ),
        ),
      ),
    );
  }
}

