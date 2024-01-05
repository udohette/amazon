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
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical, itemCount: 2,shrinkWrap: true, itemBuilder: (context, index){
                  return Container(
                    height: height * 0.3,
                    width: width,
                    margin: EdgeInsets.symmetric(vertical: height * 0.01),
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.01),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: greyShade1
                    ),
                    child: Row(children: 
                    [Expanded(flex:4, 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Image(image: AssetImage("assests/images/todays_deals/todaysDeal1.png"), fit: BoxFit.fitWidth,),
                        CommonFunctions.blankSpace(height * 0.01, 0),
                        Container(
                          height:  height * 0.06,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: greyShade3)
                          ),
                          child: Row(children: [
                            Expanded(flex:2, child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: greyShade3))), child: Icon(Icons.remove),),),
                            Expanded(flex: 3, child: Container(color: white, alignment: Alignment.center, child: Text("1"),)),
                            Expanded(flex: 2, child: Container(decoration: BoxDecoration(border: Border(left: BorderSide(color: greyShade3))), child: Icon(Icons.add),))
                          ],),
                        ),

                    ],),
                    ),
                      CommonFunctions.blankSpace( 0 , width * 0.02),
                      Expanded(flex: 7, child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text("Product Name", style: textTheme.headlineMedium),
                        CommonFunctions.blankSpace( height * 0.01 , 0),
                        Text(" N 46,999", style: textTheme.headlineSmall),
                          CommonFunctions.blankSpace( height * 0.01 , 0),
                          Text(" Eligible for free shipping", style: textTheme.headlineSmall!.copyWith(color: grey)),
                          CommonFunctions.blankSpace( height * 0.01 , 0),
                          Text(" In Stock", style: textTheme.headlineSmall!.copyWith(color: CupertinoColors.activeGreen)),
                          CommonFunctions.blankSpace( height * 0.01 , 0),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                            children: [
                            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: greyShade3)), child: Text('Delete', style: textTheme.headlineSmall,),),
                            ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.white, side: BorderSide(color: greyShade3)), child: Text('Save for later', style: textTheme.headlineSmall,),)
                          ],)
                      ],))
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

