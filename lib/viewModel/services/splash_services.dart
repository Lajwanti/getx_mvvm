

import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/route_name.dart';
import 'package:getx_mvvm/viewModel/controller/LoginPreference/user_perference_view.dart';

class SplashServices{

  UserPreference userPreference = UserPreference();
  void isLogin(){




    userPreference.getUser().then((value) => {
      print(value.token),
      print(value.isLogin),
    if(value.isLogin == false || value.isLogin.toString() == "null"){

        Timer(const Duration(seconds: 5), ()=> Get.toNamed(RouteName.loginView)),

    }else{
    Timer(const Duration(seconds: 5), ()=> Get.toNamed(RouteName.homeView)),

    }


    });

  }


}