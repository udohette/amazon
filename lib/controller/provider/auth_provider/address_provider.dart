import 'package:amazon/controller/services/user_data_crud_services/user_data_CRUD_service.dart';
import 'package:flutter/foundation.dart';

import '../../../model/address_model.dart';

class AddressProvider extends ChangeNotifier{
  List<AddressModel> allAddress = [];
  AddressModel currentSelectedAddress = AddressModel();
  bool fetchCurrentUserSelectedAddress = false;
  bool allUserAddress = false;

  getAllAddress()async{
    allAddress = await UserDataCrud.getAllAddress();
    allUserAddress = true;
    if (kDebugMode) {
      print("allAddress ${allAddress[0].area.toString()}");
      print("allAddress ${allAddress[1].name.toString()}");
      print("allAddress ${allAddress[2].town.toString()}");
    }
    notifyListeners();
  }

  getCurrentSelectedAddress()async{
    currentSelectedAddress = await UserDataCrud.getCurrentAddress();
    fetchCurrentUserSelectedAddress = true;
    if (kDebugMode) {
      print("currentSelectedAddress ${currentSelectedAddress.town.toString()}");
      print("currentSelectedAddress ${currentSelectedAddress.town.toString()}");
      print("currentSelectedAddress ${currentSelectedAddress.town.toString()}");
    }
    notifyListeners();
  }
}