import 'dart:developer';

import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/view/auth_screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../user/home/home_screen.dart';


class SignInLogic extends StatefulWidget {
  const SignInLogic({super.key});

  @override
  State<SignInLogic> createState() => _SignInLogicState();
}

class _SignInLogicState extends State<SignInLogic> {

  checkAuthentication(){
    bool userIsAuthenticated = AuthServices.checkAuthentication();
    userIsAuthenticated ? Navigator.pushAndRemoveUntil(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.leftToRight), (route) => false):
    Navigator.pushAndRemoveUntil(context, PageTransition(child: const AuthScreen(), type: PageTransitionType.leftToRight), (route) => false);
    log("checkAuthentication Method Called+++++++");

  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkAuthentication();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Image(image: AssetImage('assests/images/amazon_splash_screen.png'), fit: BoxFit.fill),
    );
  }
}
