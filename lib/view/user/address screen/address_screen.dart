import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_service.dart';
import 'package:amazon/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../constant/common_function.dart';
import '../../../utils/colors.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  TextEditingController nameController  = TextEditingController();
  TextEditingController mobileController  = TextEditingController();
  TextEditingController houseController  = TextEditingController();
  TextEditingController areaController  = TextEditingController();
  TextEditingController landmarkController  = TextEditingController();
  TextEditingController pincodeController  = TextEditingController();
  TextEditingController townController  = TextEditingController();
  TextEditingController statedController  = TextEditingController();
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
                Image(image: const AssetImage('assests/images/amazon_black_logo.png'), height: height * 0.04,color: black,),
                const Spacer(),
              ],),
            )),
        body: Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AddressScreenTextField(textController: nameController, hintText: 'Enter your name', title: 'Enter your Name',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: mobileController, hintText: 'Enter your mobile number', title: 'Enter your mobile number',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: houseController, hintText: 'Enter your house number', title: 'Enter your house number',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: areaController, hintText: 'Enter your area ', title: 'Enter your area ',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: landmarkController, hintText: 'Enter your landmark', title: 'Enter your landmark',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: pincodeController, hintText: 'Enter your pincode ', title: 'Enter your pincode ',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: townController, hintText: 'Enter your town ', title: 'Enter your town ',),
                CommonFunctions.blankSpace(height * 0.02, 0),
                AddressScreenTextField(textController: statedController, hintText: 'Enter your state ', title: 'Enter your state ',),
                CommonFunctions.blankSpace(height * 0.04, 0),
            
                ElevatedButton(
                  onPressed: (){
                    Uuid uuid = const Uuid();
                    String docId = uuid.v1();
                    AddressModel addressModel = AddressModel(
                        nameController.text.trim(),
                        mobileController.text.trim(),
                        houseController.text.trim(),
                        areaController.text.trim(),
                        landmarkController.text.trim(),
                        pincodeController.text.trim(),
                        townController.text.trim(),
                        statedController.text.trim(),
                        true,
                        docId);
                    UserDataCrud.addUserAddress(addressModel: addressModel, context: context, docID: docId);
                  }, style: ElevatedButton.styleFrom(backgroundColor: amber, minimumSize: Size(width, height * 0.06) ),
                  child:  Text('Add Address', style: textTheme.headlineSmall,),
                )],
            ),
          ),

        ),
      
      ),
    );
  }
}

class AddressScreenTextField extends StatelessWidget {
  final TextEditingController textController;
  final String title;
  final String hintText;
    const AddressScreenTextField({super.key, required this.textController, required this.title, required this.hintText});
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       Text(title),
      CommonFunctions.blankSpace(height * 0.01, width),
      TextField(
        controller: textController,
        //keyboardType: TextInputType.name,
        decoration:InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03,vertical: 0),
            hintText: hintText,
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

    ],);
  }
}
