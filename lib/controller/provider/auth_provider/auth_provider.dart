import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  String phoneNumber = "";
  String verificationId ='';
  String otp ='';

  updatePhoneNum({required String num}){
    phoneNumber = num;
    notifyListeners();
  }
  updateVerificationId({required String verificationID}){
    verificationId = verificationID;
    notifyListeners();
  }

}