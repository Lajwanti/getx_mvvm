

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class Utils{

  static void fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  
  
  static void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.baseBlackColor,
      gravity: ToastGravity.BOTTOM,

    );
  }

  static void toastMessageCenter(String message){
    Fluttertoast.showToast(
        msg: message,
      backgroundColor: AppColors.baseBlackColor,
      gravity: ToastGravity.CENTER,

    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
        title,
        message
    );
  }
}