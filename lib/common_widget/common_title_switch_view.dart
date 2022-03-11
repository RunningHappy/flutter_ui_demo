import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTitleSwitchView extends Container{
  String title;
  double? fontSize;
  Color? titleNormalColor;
  Color? titleActivityColor;
  double? radius;
  Color? backColor;
  Color? switchNormalColor;
  Color? switchActivityColor;
  double? paddingH;
  double? paddingV;
  bool activity;
  Function(bool)? switchChange;
  CommonTitleSwitchView({Key? key,required this.title,this.paddingH,required this.activity,this.paddingV,this.fontSize,this.titleNormalColor,this.titleActivityColor,this.radius,this.backColor,this.switchNormalColor,this.switchActivityColor,this.switchChange}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??8.h),
        color: backColor??Color(0xFFF6F7F9)
      ),
      padding: EdgeInsets.symmetric(horizontal: paddingH??20.w,vertical: paddingV??14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize??16.sp,
              color: activity ? titleActivityColor??Colors.black : titleNormalColor??Color(0xFF828282)
            ),
          ),
          Transform.scale(
            scale: 0.9,
            child: CupertinoSwitch(
              value: activity,
              activeColor: switchActivityColor??Color(0xFF888BF4),
              trackColor: switchNormalColor??Color(0xFFBDBDBD),
              onChanged: (bool value){
                if(switchChange != null){
                  switchChange!(value);
                }
              }
            ),
          )
        ],
      ),
    );
  }
}