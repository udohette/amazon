
import 'dart:developer';

import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:amazon/view/auth_screen/signin_logic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices{

  static bool checkAuthentication(){
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if(user != null){
      log("User is Authenticated Successfully*************");
      print("User UID ${FirebaseAuth.instance.currentUser?.uid}");
      log("Navigating to Home Screen ====  User != null ");
      return true;
    }else{
      log("User Authentication Failed >  User = Null or Logged Out----------------------------------------------");
      print("User UID ${FirebaseAuth.instance.currentUser?.uid}");
      log("User  Authentication Failed ---------------------------------------------");
      log("Navigating to AuthScreen Screen");
      return false;
    }
  }

  // static checkAuthenticationStatus({required BuildContext context}){
  //   bool userIsAuthenticated = AuthServices.checkAuthentication();
  //   userIsAuthenticated ? Navigator.pushAndRemoveUntil(context, PageTransition(child: const HomeScreen(), type: PageTransitionType.leftToRight), (route) => false):
  //   Navigator.pushAndRemoveUntil(context, PageTransition(child: const AuthScreen(), type: PageTransitionType.leftToRight), (route) => false);
  //   log("checkAuthenticationStatus Method Called+++++++");
  //   print("checkAuthenticationStatus Method Called+++++++");
  //   log("Navigating to Home Screen");
  // }

  static receiveOTP({required BuildContext context, required String mobileNumber})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
          verificationCompleted: (PhoneAuthCredential credentials)async{
            print("Auto Credentials Passed:  $credentials");
            // ANDROID ONLY!

            // Sign the user in (or link) with the auto-generated credential
            await auth.signInWithCredential(credentials);

          },
          verificationFailed: (FirebaseAuthException exception){
            if (exception.code == 'invalid-phone-number') {
              print('The provided phone number is not valid.');
            }
            print("Credentials Failed: $exception");
            log("Phone Verification Failed ${exception.credential}");
            log("Phone Verification Failed2 ${exception.phoneNumber}");
            log("Phone Verification Failed with Message ${exception.message}");

          },
          codeSent: (String verificationID, int? resendToken){

          context.read<AuthProvider>().updateVerificationId(verificationID: verificationID);
          context.read<AuthProvider>().updatePhoneNum(num: mobileNumber);
          print("verificationID Passed With=======:  $verificationID");
          log("verificationID  Passed With=======:  $verificationID");
          print("mobileNumber Passed With=======:  $mobileNumber");
          log("mobileNumber  Passed With=======:  $mobileNumber");
            Navigator.push(context, PageTransition(child: OTPScreen(mobileNumber: mobileNumber), type: PageTransitionType.rightToLeft));
          print("verificationID Passed:  $verificationID");

          },
          timeout: const Duration(seconds: 60),
          codeAutoRetrievalTimeout: (String verificationID){

          },
      );
    }catch(e){
      if (kDebugMode) {
        print('Catch Block: $e');
      }
    }

  }
  static verifyOTP({required BuildContext context, required String otp})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: context.read<AuthProvider>().verificationId,
          smsCode: otp);
      await auth.signInWithCredential(credential);
      log("otp  Passed With=======:  $otp");
      print("otp  Passed With=======:  $otp");
      // checkAuthenticationStatus(context: context);
      Navigator.push(context, PageTransition(child:  SignInLogic(), type: PageTransitionType.rightToLeft));
    }catch(e){
      print("Catch Block: $e");

    }

  }

}