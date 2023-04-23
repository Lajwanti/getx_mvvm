import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:getx_mvvm/res/components/roundButton.dart';
import 'package:getx_mvvm/viewModel/controller/Login/login_view_model.dart';

class LoginButton extends StatelessWidget {
  final formKey;
   LoginButton({Key? key, required this.formKey}) : super(key: key);
  LoginViewModelController loginViewModel = Get.put(LoginViewModelController());

  @override
  Widget build(BuildContext context) {
    return  Obx((){
      return  RoundButton(title: "Login",
        height: 50,
        width: 200,
        btnColor: AppColors.baseLightPinkColor,
        loading: loginViewModel.loading.value,
        onPress: (){
          if(formKey.currentState!.validate()){
            loginViewModel.loginApi();

          }

        },);
    });
  }
}
