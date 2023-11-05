import 'dart:math';

import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/view/auth_screen/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class AuthServices{
  static receiveOTP({required BuildContext context, required String mobileNumber})async{
    FirebaseAuth auth = FirebaseAuth.instance;
    try{
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNumber,
          verificationCompleted: (PhoneAuthCredential credentials){
            print("Credentials$credentials");

          },
          verificationFailed: (FirebaseAuthException exception){
            print("Credentials$exception");

          },
          codeSent: (String verificationID, int? resendToken){
          context.read<AuthProvider>().updateVerificationId(verificationID: verificationID);
            Navigator.push(context, PageTransition(child: OTPScreen(mobileNumber: mobileNumber), type: PageTransitionType.rightToLeft));

          },
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

    }catch(e){
      print("Catch Block: $e");

    }

  }

}