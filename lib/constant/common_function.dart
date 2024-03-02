import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/colors.dart';

class CommonFunctions{
  static blankSpace(double height, double width){
    return SizedBox(height: height??0, width: width??0,);
  }
  static divider(){
    return Divider(color: greyShade3,height: 0, thickness: 3,);
  }

  static showToast({required BuildContext context, required String message}){
    return Fluttertoast.showToast(
        msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: white,
      textColor: black,
      fontSize: 16.0);
  }
}