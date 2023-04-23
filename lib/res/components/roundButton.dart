import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const  RoundButton({
    this.textColor = AppColors.baseLightGreenColor,
    this.btnColor = AppColors.baseGrey40Color,
    required this.title,
    required this.onPress,
    this.width = 60,
    this.height = 50,
    this.loading = false

  });

  final bool  loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, btnColor;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: btnColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: loading? const Center(child:  CircularProgressIndicator()) : Center(child: Text(title),),


      ),
    );
  }
}
