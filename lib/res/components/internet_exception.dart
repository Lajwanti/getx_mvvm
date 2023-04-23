import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class InternetException extends StatefulWidget {

  final VoidCallback onPress;
  const InternetException({Key? key, required this.onPress}) : super(key: key);

  @override
  _InternetExceptionState createState() => _InternetExceptionState();
}

class _InternetExceptionState extends State<InternetException> {
  @override


  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
      child: Column(
        children: [
          Icon(Icons.cloud_off,color: AppColors.baseGrey40Color,size: 40,),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(child: Text("internet_exception".tr)),
          ),
          SizedBox(height: height*.15,),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 50,
              width: 150,
              color: AppColors.baseLightPinkColor,
              child: const Center(child: Text("Retry")),),
          )
        ],
      ),

    );
  }
}
