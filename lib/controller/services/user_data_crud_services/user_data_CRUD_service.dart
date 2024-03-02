import 'dart:developer';

import 'package:amazon/constant/common_function.dart';
import 'package:amazon/constant/constants.dart';
import 'package:amazon/model/address_model.dart';
import 'package:amazon/model/user_model.dart';
import 'package:amazon/view/auth_screen/signin_logic.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:uuid/uuid.dart';

class UserDataCrud {
  static Future addNewUser({required UserModel userModel, required BuildContext context}) async {
    try {
      await firestore
          .collection("user")
          .doc(auth.currentUser!.phoneNumber)
          .set(userModel.toMap())
          .whenComplete(() {
            log('Data Added');
            CommonFunctions.showToast(context: context, message: 'User Added Successfully');
            Navigator.pushAndRemoveUntil(context, PageTransition(child: const SignInLogic(), type: PageTransitionType.rightToLeft), (route) => false);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }
  static Future<bool> checkUser()async{
    bool userPresent = false;
    try{
      await firestore.collection('user').where('mobileNum', isEqualTo: auth.currentUser!.phoneNumber).get()
          .then((value) => value.size > 0 ? userPresent =  true : userPresent = false);
    }catch(e){
      log(e.toString());
      //CommonFunctions.showToast(context: context, message: e.toString());
    }
    return userPresent;
  }


  static Future addUserAddress({required AddressModel addressModel, required BuildContext context, required String docID})async{
    try {
      await firestore
          .collection("Address")
          .doc(auth.currentUser!.phoneNumber).collection('address').doc(docID)
          .set(addressModel.toMap())
          .whenComplete(() {
        log('Data Added');
        CommonFunctions.showToast(context: context, message: 'Address Added Successfully');
        //Navigator.pushAndRemoveUntil(context, PageTransition(child: const SignInLogic(), type: PageTransitionType.rightToLeft), (route) => false);
        Navigator.pop(context);
      });
    } catch (e) {
      log(e.toString());
      CommonFunctions.showToast(context: context, message: e.toString());
    }
  }
  static Future<bool> checkUserAddress()async{
    bool addressPresent = false;
    try{
      await firestore
          .collection("Address")
          .doc(auth.currentUser!.phoneNumber).collection('address').get()
          .then((value) => value.size > 0 ? addressPresent =  true : addressPresent = false);
    }catch(e){
      log(e.toString());
      //CommonFunctions.showToast(context: context, message: e.toString());
    }
    return addressPresent;
  }

  static Future<List<AddressModel>> getAllAddress()async{
    List<AddressModel> allAddress = [];
    AddressModel defaultAddress = AddressModel();
    try{
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection('Address').doc(auth.currentUser!.phoneNumber).collection('address').get();
      snapshot.docs.forEach((element) {
        allAddress.add(AddressModel.fromMap(element.data()));
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if(currentAddress.isDefault == true){
          defaultAddress = currentAddress;
          log("User_data_crud_services ${defaultAddress.name.toString()}");
          log("User_data_crud_services currentAddress ${currentAddress.name.toString()}");
        }
      });

    }catch(e){
      log("error Found");
      log(e.toString());
    }
    for(var data in allAddress){
      log("Data From All Address: ${data.toMap().toString()}");
    }
    return allAddress;
  }

  static Future getCurrentAddress()async{
    AddressModel defaultAddress = AddressModel();
    try{
      final QuerySnapshot<Map<String, dynamic>> snapshot = await firestore.collection('Address').doc(auth.currentUser!.phoneNumber).collection('address').get();
      for (var element in snapshot.docs) {
        AddressModel currentAddress = AddressModel.fromMap(element.data());
        if(currentAddress.isDefault == true){
          defaultAddress = currentAddress;
          log("User_data_crud_services ${defaultAddress.name.toString()}");
          log("User_data_crud_services currentAddress ${currentAddress.town.toString()}");
        }
      }

    }catch(e){
      log("error Found");
      log(e.toString());
    }
    return defaultAddress;

  }
}

