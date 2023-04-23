import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/viewModel/controller/Login/login_view_model.dart';

class InputPasswordField extends StatelessWidget {
   InputPasswordField({Key? key}) : super(key: key);

  LoginViewModelController loginViewModel = Get.put(LoginViewModelController());

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: loginViewModel.passwordController.value,
      focusNode: loginViewModel.passwordFocusNode.value,
      obscureText: true,
      obscuringCharacter: "*",
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar("Password", "Enter Password");
        }

      },
      decoration: InputDecoration(
          hintText: "password_hint".tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
