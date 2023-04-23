import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/LoginUserModel/UserModel.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/route_name.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/viewModel/controller/LoginPreference/user_perference_view.dart';

class LoginViewModelController extends GetxController{

  final _api = LoginRepository();


  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

 final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;



  void loginApi(){
    loading.value = true;

    Map data = {
      'email' : emailController.value.text,
      'password' : passwordController.value.text,
    };
    UserModel userModel;


    _api.loginApi(data).then((value) => {
    loading.value = false,
      if(value["error"] == "user not found"){
        Utils.snackBar("Login",value["error"] )


      }else{
       userModel = UserModel(
      token: value["token"],
      isLogin: true,
    ),

    userPreference.saveUser(userModel).then((value){
      Get.delete<LoginViewModelController>();

          Get.toNamed(RouteName.homeView)!.then((value){});
        }).onError((error, stackTrace){


        }),
        Utils.snackBar("Login", "Login successfully")

      }



    }).onError((error, stackTrace){
      print(error.toString());
      loading.value = false;

      return Utils.snackBar("Error", error.toString());
    });

  }




}