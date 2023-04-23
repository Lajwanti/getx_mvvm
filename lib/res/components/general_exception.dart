import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getx_mvvm/res/colors/app_colors.dart';

class GeneralExceptonWidget extends StatefulWidget {

  final VoidCallback onPress;
  const GeneralExceptonWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  _GeneralExceptonWidgetState createState() => _GeneralExceptonWidgetState();
}

class _GeneralExceptonWidgetState extends State<GeneralExceptonWidget> {
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
            child: Center(child: Text("general_exception".tr)),
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
