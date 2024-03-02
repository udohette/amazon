import 'dart:developer';

import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_service.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:amazon/view/user/user_data_screen/user_data_input_screen.dart';
import 'package:amazon/view/user/user_persistent_nav_bar/user_bottome_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../user/home/home_screen.dart';


class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthentication();
    });
    super.initState();
  }
  checkUser()async{
    bool userAlreadyThere = await UserDataCrud.checkUser();
    if(userAlreadyThere == true){
      log('userAlreadyThere ====== YES');
      Navigator.push(context, PageTransition(child: UserBottomNavBar(), type: PageTransitionType.rightToLeft));
    }else{
      log('userAlreadyThere ====== NO');
      Navigator.push(context, PageTransition(child: UserDataInputScreen(), type: PageTransitionType.rightToLeft));
    }
  }

  checkAuthentication(){
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated ? checkUser() : Navigator.pushAndRemoveUntil(context, PageTransition(child: const AuthScreen(), type: PageTransitionType.leftToRight), (route) => false);
    //Navigator.pushAndRemoveUntil(context, PageTransition(child: UserBottomNavBar(), type: PageTransitionType.leftToRight), (route) => false);
    log("checkAuthentication Method Called+++++++");

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(image: AssetImage('assests/images/amazon_splash_screen.png'), fit: BoxFit.fill),
    );
  }
}
