import 'dart:developer';

import 'package:amazon/constant/common_function.dart';
import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'auth_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.mobileNumber});
  final String mobileNumber;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    //final TextTheme textTheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage("assests/images/amazon_logo.png"),
          height: height * 0.04,
        ),),
      body: SafeArea(
          child: Container(
            height: height,
            width: width,
            padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Authentication is Required", style: textTheme.displayMedium,),
                CommonFunctions.blankSpace(height * 0.02, 0),
                RichText(text: TextSpan(children: [
                  TextSpan(text: widget.mobileNumber,style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
                  TextSpan(text: " change",style: textTheme.bodyMedium)
                ])),
                CommonFunctions.blankSpace(height * 0.02, 0),
                Text("We have send a One Time Password (OTP) to the mobile number above. Please enter it to complete verification",style: textTheme.bodyMedium,),
                CommonFunctions.blankSpace(height * 0.02, 0),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration:InputDecoration(
                      hintText: 'Enter OTP',
                      hintStyle: textTheme.bodySmall,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: secondaryColor),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey),
                          borderRadius: BorderRadius.circular(5)
                      )

                  ),

                ),
                CommonFunctions.blankSpace(height * 0.02, 0),
                CommonAuthButton(title: "Continue", onPressed: (){
                  AuthServices.verifyOTP(context: context, otp: otpController.text);
                  log("otp  Passed With=======:  ${otpController.text}");
                  print("otp  Passed With=======:  ${otpController.text}");

                },btnWidth: 0.94,),
                CommonFunctions.blankSpace(height * 0.02, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){

                    }, child: Text("Resend OTP",style: textTheme.bodyMedium!.copyWith(color: blue,fontSize: 20),)),
                  ],
                ),
                 const BottomAuthScreenWidget(),
              ],
            ),
          )),

    );
  }
}
