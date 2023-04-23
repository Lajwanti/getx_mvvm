

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:getx_mvvm/res/components/roundButton.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view/login/widgets/input_email_field.dart';
import 'package:getx_mvvm/view/login/widgets/input_password_field.dart';
import 'package:getx_mvvm/view/login/widgets/login_btn.dart';
import 'package:getx_mvvm/viewModel/controller/Login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}




class _LoginViewState extends State<LoginView> {

  LoginViewModelController loginViewModel = Get.put(LoginViewModelController());
  final _formkey  = GlobalKey<FormState>();

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.baseLightPinkColor,
        automaticallyImplyLeading: false,
        title: Text("login".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key:  _formkey,
              child: Column(
                children: [

                  InputEmailField(),
                  const SizedBox(height: 40,),
                 InputPasswordField(),
                ],
              ),
            ),


            const SizedBox(height: 40,),
            LoginButton(formKey:_formkey)



          ],
        ),
      ),
    );
  }
}
