import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CommonTitleAppBar(
  String rightImg,
  String title,
  String subTitle,
  {
   double? titleFont,
   Color? titleColor,
   FontWeight? fontWeight,
   double? subTitleFont,
   Color? subTitleColor,
   FontWeight? subFontWeight,
   double? rightImgWidth,
   Function()? clickRightAction,
  }){

  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 0,
    title: Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: titleFont??24.sp,
                  color: titleColor??Colors.black,
                  fontWeight: fontWeight??FontWeight.w700
                ),
              ),
              SizedBox(width: 5.w,),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: subTitleFont??24.sp,
                  color: subTitleColor??Colors.black,
                  fontWeight: subFontWeight??FontWeight.w600
                ),
              )
            ],
          )
        ),
        GestureDetector(
          onTap: (){
            if(clickRightAction != null){
              clickRightAction();
            }
          },
          child: Image.asset(rightImg,width: rightImgWidth??24.h,height: rightImgWidth??24.h,),
        )
      ],
    ),
  );
}