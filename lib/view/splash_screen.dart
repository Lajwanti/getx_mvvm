import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/res/assets/images_asset.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';
import 'package:getx_mvvm/res/components/general_exception.dart';
import 'package:getx_mvvm/res/components/internet_exception.dart';
import 'package:getx_mvvm/res/components/roundButton.dart';
import 'package:getx_mvvm/res/fonts/app_fonts.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/viewModel/services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();

}

SplashServices splashServices = SplashServices();

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.isLogin();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.baseLightPinkColor,
      body: Center(child: Text("welcome_back".tr)),
    );
  }
}
