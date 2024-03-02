import 'dart:developer';
import 'package:amazon/constant/common_function.dart';
import 'package:amazon/constant/constants.dart';
import 'package:amazon/controller/provider/auth_provider/address_provider.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/utils/colors.dart';
import 'package:amazon/view/user/address%20screen/address_screen.dart';
import 'package:amazon/view/user/user_persistent_nav_bar/user_bottome_nav_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../controller/services/user_data_crud_services/user_data_CRUD_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController todaysDealController = CarouselController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  checkUserAddress() async {
    bool isUserAddressPresent = await UserDataCrud.checkUserAddress();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    if (isUserAddressPresent == false) {
      showModalBottomSheet(
        //backgroundColor: transparent,
          context: context,
          builder: (builder) {
            return Container(
              alignment: Alignment.center,
              height: height * 0.3,
              width: width,
              padding: EdgeInsets.symmetric(vertical: height * 0.04, horizontal: width * 0.03),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Add your adderss', style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),),
                 SizedBox(
                   height: height * 0.15,
                   child: ListView.builder(
                     shrinkWrap: true,
                       scrollDirection: Axis.horizontal,
                       itemCount: 1,
                       itemBuilder: (context, index){
                       return InkWell(
                         onTap: () {
                           if(index == 0){
                             Navigator.push(context, PageTransition(child: AddressScreen(), type: PageTransitionType.rightToLeft));
                           }
                         },
                         child: Container(
                           width: width * 0.35,
                           //height: height * 0.01,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(color: greyShade3)
                           ),
                           child: Builder(builder: (context){
                             if(index == 0){
                               return Text('Add your adderss', style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: greyShade3,),);
                             }
                             return Text('Add your adderss', style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: greyShade3),);
                           }),

                         ),
                       );

                   }),
                 )
                ],
              ),
            );
          });
    }
  }

  headphoneDeals(int index) {
    switch (index) {
      case 0:
        return "Bose";
      case 1:
        return "BoAt";
      case 2:
        return "Sony";
      case 3:
        return "OnePlus";
    }
  }

  clothingDeals(int index) {
    switch (index) {
      case 0:
        return "Kurtars, Sarees & More";
      case 1:
        return "Top, Dress & More";
      case 2:
        return "T-Shrit, Jean & More";
      case 3:
        return "View All";
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkUserAddress();
       context.read<AddressProvider>().getCurrentSelectedAddress();
      //AddressModel selectedAddress = AddressProvider().getCurrentSelectedAddress();
      AddressModel selectedAddress = AddressModel();
      log('selectedAddress  ${selectedAddress.name.toString()}');
      log('selectedAddress  ${selectedAddress.town.toString()}');
      log('selectedAddress  ${selectedAddress.docID}');
      log('selectedAddress  ${selectedAddress.mobileNumber}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
      appBar: PreferredSize(
          preferredSize: Size(width * 1, height * 0.08),
          child: HomePageAppBar(width: width, height: height)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenAddressBar(height: height, width: width),
            CommonFunctions.divider(),
            HomeScreenCategoriesList(),
            CommonFunctions.blankSpace(height * 0.01, 0),
            CommonFunctions.divider(),
            HomeScreenBanner(height: height),
            todaysDealHomeScreenWidget(
                todaysDealController: todaysDealController),
            CommonFunctions.divider(),
            // CommonFunctions.blankSpace(height * 0.01, 0),
            otherOfferGridWidget(
                title: "Latest Launches in Headphones",
                textBtName: 'Explore More',
                productPicsNameList: headphonesDeals,
                offerFor: 'headphone'),
            CommonFunctions.divider(),
            Container(
              height: height * 0.35,
              width: width,
              child: const Image(
                  image: AssetImage(
                      'assests/images/offersNsponcered/insurance.png'),
                  fit: BoxFit.fill),
            ),
            CommonFunctions.divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Sponsored',
                  style: textTheme.bodySmall?.copyWith(color: Colors.green),
                ),
                Icon(
                  Icons.info_outline_rounded,
                  size: 15,
                )
              ],
            ),
            otherOfferGridWidget(
                title: "Minimum 70% off | Top offers on clothing",
                textBtName: 'See al deals',
                productPicsNameList: clothingDealsList,
                offerFor: 'clothing'),
            CommonFunctions.divider(),
            Column(
              children: [
                Text(
                  "Watch Sixer Only on miniTV",
                  style: textTheme.displaySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.03, vertical: height * 0.01),
                  //height: height * 0.43,
                  width: width,
                  child: const Image(
                      image: AssetImage(
                          'assests/images/offersNsponcered/sixer.png'),
                      fit: BoxFit.fill),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Container otherOfferGridWidget(
      {required String title,
      required String textBtName,
      required List<String> productPicsNameList,
      required String offerFor}) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
          ),
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 10,
              ),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assests/images/offersNsponcered/${productPicsNameList[index]}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        offerFor == 'headphone'
                            ? headphoneDeals(index)
                            : clothingDeals(index),
                        style: textTheme.bodyMedium,
                      )
                    ],
                  ),
                );
              }),
          TextButton(
              onPressed: () {},
              child: Text(
                textBtName,
                style: textTheme.bodyMedium?.copyWith(color: Colors.green),
              ))
        ],
      ),
    );
  }
}

class todaysDealHomeScreenWidget extends StatelessWidget {
  const todaysDealHomeScreenWidget({
    super.key,
    required this.todaysDealController,
  });

  final CarouselController todaysDealController;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "50%-80% off | Latest deals.",
              style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            CarouselSlider(
              carouselController: todaysDealController,
              options: CarouselOptions(
                  height: height * 0.2, autoPlay: true, viewportFraction: 1),
              items: todaysDeals.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(),
                      child: Image(
                        image: AssetImage('assests/images/todays_deals/$i'),
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: red,
                  ),
                  child: Text(
                    'upto 62% off',
                    style: textTheme.labelMedium!.copyWith(color: white),
                  ),
                ),
                CommonFunctions.blankSpace(0, width * 0.03),
                Text(
                  'Deal of the Day',
                  style: textTheme.labelMedium!
                      .copyWith(color: red, fontWeight: FontWeight.bold),
                )
              ],
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Text(
              "Top Deals on Titan, Fastrack, Casio & More",
              style: textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600, color: Colors.black54),
            ),
            CommonFunctions.blankSpace(height * 0.01, 0),
            GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      log(index.toString());
                      todaysDealController.animateToPage(index);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: greyShade3),
                        image: DecorationImage(
                          image: AssetImage(
                              'assests/images/todays_deals/${todaysDeals[index]}'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  );
                }),
            TextButton(
                onPressed: () {},
                child: Text(
                  'See all Deals',
                  style: textTheme.bodyMedium?.copyWith(color: Colors.green),
                ))
          ],
        ),
      ),
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
      carouselController: CarouselController(),
      options: CarouselOptions(
          height: height * 0.24, autoPlay: true, viewportFraction: 1),
      items: carouselPictures.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              //margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.amber),
              child: Image(
                image: AssetImage('assests/images/carousel_slideshow/$i'),
                fit: BoxFit.cover,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class HomeScreenCategoriesList extends StatelessWidget {
  HomeScreenCategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: height * 0.09,
      width: width,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage(
                        'assests/images/categories/${categories[index]}.png'),
                    height: height * 0.07,
                  ),
                  Text(
                    categories[index],
                    style: textTheme.labelMedium,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class HomeScreenAddressBar extends StatelessWidget {
  final double height;
  final double width;

  const HomeScreenAddressBar({super.key, required this.height, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: addressBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Consumer<AddressProvider>(builder: (context, addressProvider, child){
        if(addressProvider.fetchCurrentUserSelectedAddress == true){

          //AddressModel selectedAddress = AddressModel();
          AddressModel selectedAddress = AddressProvider().getCurrentSelectedAddress();
          log('selectedAddress  ${selectedAddress.name.toString()}');
          log('selectedAddress  ${selectedAddress.town.toString()}');
          log('selectedAddress  ${selectedAddress.docID}');
          log('selectedAddress  ${selectedAddress.mobileNumber}');
          return Row(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Icon((Icons.location_pin),color: black),
              CommonFunctions.blankSpace(0, width * 0.02),
              Text('Deliver to ${selectedAddress.name.toString()} - ${selectedAddress.town.toString()}, ${selectedAddress.area.toString()}',),
          ],);
        }else{
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              Icon((Icons.location_pin),color: black),
              CommonFunctions.blankSpace(0, width * 0.02),
              Text('Deliver to  user city',style: TextStyle(fontSize: 12))],);
        }
      }),
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
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.012),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: appBarGradientColor,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              width: width * 0.87,
              child: TextField(
                cursorColor: black,
                onTap: () {
                  log("redirecting you to product screen");
                },
                decoration: InputDecoration(
                  hintText: 'Search Amazon.In',
                  fillColor: white,
                  filled: true,
                  prefixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.search),
                    color: black,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.camera),
                    color: grey,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: width * 0.03),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey)),
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: grey)),
                ),
              )),
          Icon(Icons.mic)
        ],
      ),
    );
  }
}
