import 'package:amazon/constant/common_function.dart';
import 'package:amazon/constant/constants.dart';
import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_service.dart';
import 'package:amazon/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class UserDataInputScreen extends StatefulWidget {
  const UserDataInputScreen({super.key});

  @override
  State<UserDataInputScreen> createState() => _UserDataInputScreenState();
}

class _UserDataInputScreenState extends State<UserDataInputScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    phoneController.text = auth.currentUser!.phoneNumber??'';
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: Size(width,  height * 0.08),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.01),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: appBarGradientColor, begin: Alignment.centerLeft, end: Alignment.centerRight)
              ),
              child: Row(children: [
                Image(image: const AssetImage('assests/images/amazon_black_logo.png'), height: height * 0.04, color: black,),
                const Spacer(),
              ],),
            )),
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Help us about knowing you more"),
              CommonFunctions.blankSpace(height * 0.01, width),
              const Text("Enter your name"),
              CommonFunctions.blankSpace(height * 0.01, width),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration:InputDecoration(
                    hintText: 'enter your name',
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
              CommonFunctions.blankSpace(height * 0.01, width),
              const Text("Enter your phone number"),
              CommonFunctions.blankSpace(height * 0.01, width),
              TextField(
                controller: phoneController,
                readOnly: true,
                keyboardType: TextInputType.name,
                decoration:InputDecoration(
                    hintText: 'phone number',
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
              const Spacer(),
              ElevatedButton(onPressed: ()async{
                UserModel userModel = UserModel (name: nameController.value.text.trim(), mobileNum: phoneController.text.trim(), userType: 'user');
                await UserDataCrud.addNewUser(userModel: userModel, context: context);
              }, style: ElevatedButton.styleFrom(backgroundColor: amber,minimumSize: Size(width, height * 0.06)), child:Text('Proceed', style: textTheme.headlineSmall),)
            ],
          ),
        ),
      
      ),
    );
  }
}
