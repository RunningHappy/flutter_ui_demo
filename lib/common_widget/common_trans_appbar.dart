import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CommonTansAppBar(double opacity,Function()? clickBack,{String? title,double? fontSize,bool? showBack = true,List<Widget>? actions,FontWeight? fontWeight,Color? backIconColor}){

  return AppBar(
    backgroundColor: Color.fromRGBO(255, 255, 255, opacity),
    elevation: 0,
    leadingWidth: 50.w,
    title: Offstage(
      offstage: title != null ? false : true,
      child: Text(
        title??'',
        style: TextStyle(
          fontSize: fontSize??14.sp,
          fontWeight: fontWeight??FontWeight.normal,
          color: opacity > 0.4 ? Color.fromRGBO(0, 0, 0, opacity) : Colors.white,
        ),
      ),
    ),
    leading: Offstage(
      offstage: showBack! ? false : true,
      child: GestureDetector(
        onTap: (){
          if(clickBack != null){
            clickBack();
          }
        },
        child: Container(
          margin: EdgeInsets.only(left: 15.w,top: 8.w,bottom: 8.w),
          width: 32.w,
          height: 32.w,
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.w),
            color: backIconColor??const Color(0x20FFFFFF)
          ),
          child: Image.asset(
            'images/discover/detail_back_icon.png',
            width: 24.w,
            height: 24.w,
            color: opacity > 0.4 ? Color.fromRGBO(0, 0, 0, opacity) : Colors.white,
          ),
        ),
      ),
    ),
    actions: actions??[],
  );
}