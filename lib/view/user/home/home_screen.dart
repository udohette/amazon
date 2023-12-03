import 'dart:developer';
import 'package:amazon/constant/common_function.dart';
import 'package:amazon/constant/constants.dart';
import 'package:amazon/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
            child: HomePageAppBar(width: width, height: height)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeScreenAddressBar(height: height, width: width),
              CommonFunctions.divider(),
              HomeScreenCategoriesList(height: height, width: width, textTheme: textTheme),
              CommonFunctions.blankSpace(height  * 0.01, 0),
            CommonFunctions.divider(),
              HomeScreenBanner(height: height)
            ],
          ),

        )),
    );
  }
}

class HomeScreenBanner extends StatelessWidget {
  const HomeScreenBanner({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: height * 0.24,
      autoPlay: true,
      viewportFraction: 1),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                //margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    color: Colors.amber
                ),
                child: Image(
                  image: AssetImage('assests/images/carousel_slideshow/$i'), fit: BoxFit.cover, ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  final double height;
  final double width;
  final TextTheme textTheme;
  const HomeScreenCategoriesList({
    super.key,
    required this.height,
    required this.width,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.09,
      width: width,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Image(
              image: AssetImage('assests/images/categories/${categories[index]}.png'), height:  height * 0.07, ),
            Text(categories[index], style: textTheme.labelMedium,),
        ],),
        );
      }),
    );
  }
}

class HomeScreenAddressBar extends StatelessWidget {
  final double height;
  final double width;
  const HomeScreenAddressBar({
    super.key,
    required this.height,
    required this.width,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: addressBarGradientColor, begin: Alignment.centerLeft, end: Alignment.centerRight)
      ),
    );
  }
}

class HomePageAppBar extends StatelessWidget {
  final double width;
  final double height;
  const HomePageAppBar({
    super.key,
    required this.width,
    required this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
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
              cursorColor: black,
              onTap: (){
                log("redirecting you to product screen");
              },
              decoration: InputDecoration(
                hintText: 'Search Amazon.In',
                fillColor: white, filled: true,
                prefixIcon: IconButton(onPressed: (){},icon: Icon(Icons.search), color: black,),
                suffixIcon: IconButton(onPressed: (){},icon: Icon(Icons.camera), color: grey,),
                contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: grey)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: grey)),
                disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: grey)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5), borderSide: BorderSide(color: grey)),
              ),
            )), Icon(Icons.mic)
      ],),
    );
  }
}
