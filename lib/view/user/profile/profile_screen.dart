import 'package:amazon/constant/common_function.dart';
import 'package:amazon/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return   SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(width,  height * 0.08),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: appBarGradientColor, begin: Alignment.centerLeft, end: Alignment.centerRight)
              ),
              child: Row(children: [
                Image(image: const AssetImage('assests/images/amazon_black_logo.png'), height: height * 0.04,color: black,),
                const Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none, size: height *0.035,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.search, size: height *0.035,color: black,))
              ],),
            )),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            child: Column(
              children: [
                UserGreetingsYouScreen(width: width, textTheme: textTheme, height: height),
                CommonFunctions.blankSpace(height * 0.01, 0),
                YouGridBtn(width: width, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.02, 0),
                UserOrders(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                KeepShopping(width: width, height: height, textTheme: textTheme),
                CommonFunctions.blankSpace(height * 0.01, 0),
                CommonFunctions.divider(),
                BuyAgain(width: width, height: height, textTheme: textTheme)
              ],
            ),
          ),
        )),
    );
  }
}

class KeepShopping extends StatelessWidget {
  const KeepShopping({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical:  height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Keep Shopping For', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: black)),
              TextButton(onPressed: (){}, child: Text('Edit', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: blue)),),
              Text('|', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: grey)),
              TextButton(onPressed: (){}, child: Text('Browsing History', style: textTheme.headlineSmall?.copyWith(color: blue),),)
            ],),
          CommonFunctions.blankSpace(height * 0.01, 0),
      GridView.builder(
          itemCount: 5,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.9,
            crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10,),
          itemBuilder: (context, index){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    decoration: BoxDecoration(
                      border: Border.all(color: greyShade3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text('Product')
              ],
            );
            }),
        ],
      ),
    );
  }
}
class BuyAgain extends StatelessWidget {
  const BuyAgain({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical:  height * 0.01),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Buy Again', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: black)),
            Text('See All', style: textTheme.headlineSmall?.copyWith(color: blue),),
          ],),
        CommonFunctions.blankSpace(height * 0.01, 0),
        SizedBox(
          height: height * 0.14,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics:  PageScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  width: height * 0.14,
                  height: height * 0.14,
                  margin: EdgeInsets.symmetric(horizontal:  width * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
        ),
      ],),
    );
  }
}


class UserOrders extends StatelessWidget {
  const UserOrders({
    super.key,
    required this.width,
    required this.height,
    required this.textTheme,
  });

  final double width;
  final double height;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: width * 0.04, vertical:  height * 0.01),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Your Orders', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: black)),
           Text('See All', style: textTheme.headlineSmall?.copyWith(color: blue),),
        ],),
        CommonFunctions.blankSpace(height * 0.01, 0),
        SizedBox(
          height: height * 0.17,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics:  PageScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  width: width * 0.4,
                  height: height * 0.17,
                  margin: EdgeInsets.symmetric(horizontal:  width * 0.02),
                  decoration: BoxDecoration(
                    border: Border.all(color: greyShade3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),
        ),
      ],),
    );
  }
}

class YouGridBtn extends StatelessWidget {
  const YouGridBtn({
    super.key,
    required this.width,
    required this.textTheme,
  });

  final double width;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 4,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 4,),
        itemBuilder: (context, index){
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              decoration: BoxDecoration(
                color: greyShade3,
                border: Border.all(color: grey),
                borderRadius: BorderRadius.circular(50)

              ),
              child: Builder(builder: (context){
                if(index == 0){
                 return Text('Your Orders',style: textTheme.bodyLarge?.copyWith(color: black, fontWeight: FontWeight.bold),);
                };
                if(index == 1){
                 return Text('Buy Again',style: textTheme.bodyLarge?.copyWith(color: black, fontWeight: FontWeight.bold),);
                };
                if(index == 2){
                 return Text('Your Account',style: textTheme.bodyLarge?.copyWith(color: black, fontWeight: FontWeight.bold),);
                }
                return Text('You Whilst List',style: textTheme.bodyLarge?.copyWith(color: black, fontWeight: FontWeight.bold),);
              }),


            ),
          );
        });
  }
}
//UserGreetingsYouScreen extracted Method
class UserGreetingsYouScreen extends StatelessWidget {
  const UserGreetingsYouScreen({
    super.key,
    required this.width,
    required this.textTheme,
    required this.height,
  });

  final double width;
  final TextTheme textTheme;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Row(children: [
        RichText(text: TextSpan(children: [
          TextSpan(text: 'Hello, ', style: textTheme.headlineSmall),
          TextSpan(text: 'Dennis', style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: black))
        ])),
        const Spacer(),
        CircleAvatar(backgroundColor: greyShade3,child: IconButton(onPressed: (){}, icon: Icon(Icons.person, color: white,)),radius: height * 0.025,)
      ],),
    );
  }
}
