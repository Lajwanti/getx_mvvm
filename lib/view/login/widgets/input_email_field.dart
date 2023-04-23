
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/viewModel/controller/Login/login_view_model.dart';

class InputEmailField extends StatelessWidget {
   InputEmailField({Key? key}) : super(key: key);

  LoginViewModelController loginViewModel = Get.put(LoginViewModelController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewModel.emailController.value,
      focusNode: loginViewModel.emailFocusNode.value,
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar("Email", "Enter Email");
        }

      },
      onFieldSubmitted: (value){
        Utils.fieldFocusChange(context, loginViewModel.emailFocusNode.value, loginViewModel.passwordFocusNode.value);
      },
      decoration: InputDecoration(
          hintText: "email_hint".tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
