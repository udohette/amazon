import 'dart:developer';

import 'package:amazon/constant/common_function.dart';
import 'package:amazon/controller/provider/auth_provider/auth_provider.dart';
import 'package:amazon/controller/services/auth_services/auth_services.dart';
import 'package:amazon/utils/colors.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool inLogin = false;
  String currentCountryCode = "+234";
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
     final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: Image(
          image: const AssetImage("assests/images/amazon_logo.png"),
          height: height * 0.04,
        ),),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: height,
              width: width,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.03,
                    vertical: height * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Welcome", style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),),
                  CommonFunctions.blankSpace(height * 0.02, width * 0),
                  //SignIn(height, width, textTheme, context),
                 // createAccount(height, width, textTheme, context),
                  Builder(builder: (context){
                    if(inLogin){
                      return createAccount(height, width, textTheme, context);

                    }
                    return signIn(height, width, textTheme, context);

                  }),
                  CommonFunctions.blankSpace(height * 0.05, 0),

                  const BottomAuthScreenWidget()
              ],),
            ),
          )),
    );
  }

  Container createAccount(double height, double width, TextTheme textTheme, BuildContext context) {
    return Container(
                  decoration: BoxDecoration(border: Border.all(color: greyShade3),),
                  child: Column(children: [

                    Container(
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
                      child: Column(children: [
                        Row(children: [
                          InkWell(
                            onTap:(){
                              setState(() {
                                inLogin = true;
                              });
                            },
                            child: Container(
                              height: height * 0.04,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: grey)
                              ),
                              child: Icon(Icons.circle, size: height * 0.015,color: inLogin ? secondaryColor: transparent  ,),
                            ),
                          ),
                          CommonFunctions.blankSpace(0, width * 0.02),
                          RichText(text: TextSpan(children: [
                            TextSpan(text: "Create Account.", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "  New to Amazon?", style: textTheme.bodyMedium)
                          ]))
                        ],),
                        CommonFunctions.blankSpace(height * 0.01, 0),

                        SizedBox(
                          height: height * 0.06,
                          child: TextField(
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration:InputDecoration(
                                hintText: 'First and last name',
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
                        ),
                        CommonFunctions.blankSpace(height * 0.01, 0),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          InkWell(
                            onTap:(){
                              showCountryPicker(context: context, onSelect: (value){
                                setState(() {
                                  currentCountryCode  = '+${value.phoneCode}';
                                });

                              });
                            },

                            child: Container(height: height * 0.06,width: width * 0.2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: grey),
                                color: greyShade2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(currentCountryCode,style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                            ),
                          ),


                          SizedBox(
                            height: height * 0.06,
                            width: width * 0.64,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              cursorColor: black,
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'Mobile Number',
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
                          ),
                        ],),
                        CommonFunctions.blankSpace(height * 0.02, 0),
                        Text("By enrolling your mobile phone number, you concent to receive automated security notification "
                            "via text message from Amazon. \nMessage and data rates may apply.", style: textTheme.bodyMedium,),
                        CommonFunctions.blankSpace(height * 0.02, 0),
                        CommonAuthButton(title: "Continue", onPressed: (){}, btnWidth: 0.88,),
                        CommonFunctions.blankSpace(height * 0.02, 0),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: 'By creating an account you agree to  Amazon\'s ', style: textTheme.labelMedium),
                          TextSpan(text: 'Condition of use', style: textTheme.labelMedium?.copyWith(color: blue)),
                          TextSpan(text: ' And', style: textTheme.labelMedium),
                          TextSpan(text: ' Privacy Policy', style: textTheme.labelMedium?.copyWith(color: blue))
                        ])),
                      ],),
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: greyShade1,
                          border: Border(top: BorderSide(color: greyShade3))
                      ),
                      height:  height * 0.06,
                      width: width,
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      child: Row(children: [
                        InkWell(
                          onTap:(){
                            setState(() {
                              inLogin = false;

                            });
                          },
                          child: Container(
                            height: height * 0.04,
                            width: width * 0.04,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                border: Border.all(color: grey)
                            ),
                            child: Icon(Icons.circle, size: height * 0.015,color: inLogin ? transparent: secondaryColor ,),
                          ),
                        ),
                        CommonFunctions.blankSpace(0, width * 0.02),
                        RichText(text: TextSpan(children: [
                          TextSpan(text: "Sign In.", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "  Already a Customer?", style: textTheme.bodyMedium)
                        ]))
                      ],),
                    ),

                  ],

                  ),
                );
  }
  Container signIn(double height, double width, TextTheme textTheme, BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: greyShade3),),
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: greyShade1,
              border: Border(bottom: BorderSide(color: greyShade3))
          ),
          height:  height * 0.06,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Row(children: [
            InkWell(
              onTap:(){
                setState(() {
                  inLogin = true;

                });
              },
              child: Container(
                height: height * 0.04,
                width: width * 0.04,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: grey)
                ),
                child: Icon(Icons.circle, size: height * 0.015,color: inLogin ? secondaryColor: transparent  ,),
              ),
            ),
            CommonFunctions.blankSpace(0, width * 0.02),
            RichText(text: TextSpan(children: [
              TextSpan(text: "Create Account.", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "  New to Amazon?", style: textTheme.bodyMedium)
            ]))
          ],),
        ),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
          child: Column(children: [
            Row(children: [
              InkWell(
                onTap:(){
                  setState(() {
                    inLogin = false;
                  });
                },
                child: Container(
                  height: height * 0.04,
                  width: width * 0.04,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: grey)
                  ),
                  child: Icon(Icons.circle, size: height * 0.015,color: inLogin ? transparent: secondaryColor,),
                ),
              ),
              CommonFunctions.blankSpace(0, width * 0.02),
              RichText(text: TextSpan(children: [
                TextSpan(text: "Sign in.", style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "  Already a Customer?", style: textTheme.bodyMedium)
              ]))
            ],),
            CommonFunctions.blankSpace(height * 0.01, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:(){
                    showCountryPicker(context: context, onSelect: (value){
                      setState(() {
                        currentCountryCode  = '+${value.phoneCode}';
                      });

                    });
                  },

                  child: Container(height: height * 0.06,width: width * 0.2,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      color: greyShade2,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(currentCountryCode,style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),),
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                  width: width * 0.64,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: black,
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: 'Mobile Number',
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
                ),
              ],),
            CommonFunctions.blankSpace(height * 0.02, 0),
            CommonAuthButton(
              title: "Continue",
              onPressed: (){}, btnWidth: 0.88,),
            CommonFunctions.blankSpace(height * 0.02, 0),
            RichText(text: TextSpan(children: [
              TextSpan(text: 'By Continuing you agree to  Amazon\'s ', style: textTheme.labelMedium),
              TextSpan(text: 'Condition of use', style: textTheme.labelMedium?.copyWith(color: blue)),
              TextSpan(text: ' And', style: textTheme.labelMedium),
              TextSpan(text: ' Privacy Policy', style: textTheme.labelMedium?.copyWith(color: blue))
            ])),



          ],),
        ),

      ],
      ),
    );
  }
}

class CommonAuthButton extends StatelessWidget {
  const CommonAuthButton({super.key, required this.title, required this.onPressed, required this.btnWidth});
  final String title;
  final VoidCallback onPressed;
  final double btnWidth;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
        style: ButtonStyle(
            minimumSize: MaterialStatePropertyAll(Size(width * btnWidth, height * 0.06)),
            backgroundColor: MaterialStatePropertyAll(amber)),
        onPressed: (){}, child: const Text("Continue"));
  }
}


class BottomAuthScreenWidget extends StatelessWidget {
  const BottomAuthScreenWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(children: [
      Container(
        height: 2,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [white,greyShade3 ,white])
        ),
      ),
      CommonFunctions.blankSpace(height * 0.02, 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text('Condition of use', style: textTheme.bodySmall?.copyWith(color: blue),),
        Text('Privacy Notice', style: textTheme.bodySmall?.copyWith(color: blue),),
        Text('Help', style: textTheme.bodySmall?.copyWith(color: blue),)
      ],),
      CommonFunctions.blankSpace(height * 0.01, 0),
       Text("© 1996-2023, Amazon.com, Inc or its affiliates", style: textTheme.labelMedium?.copyWith(color: grey),)
    ],);
  }
}
