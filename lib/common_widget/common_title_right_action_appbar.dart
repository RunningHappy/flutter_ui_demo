import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CommonTitleRightActionAppBar(Function()? clickBack,String rightImage,String title,Function()? clickRight){

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 50.w,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFF000000)
      ),
    ),
    leading: GestureDetector(
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
          color: Color(0x20FFFFFF)
        ),
        child: Image.asset(
          'images/discover/detail_back_icon.png',
          width: 24.w,
          height: 24.w,
          color: Colors.black,
        ),
      ),
    ),
    actions: [
      GestureDetector(
        onTap: (){
          if(clickRight != null){
            clickRight();
          }
        },
        child: Container(
          margin: EdgeInsets.only(right: 15.w),
          child: Image.asset(
            rightImage,
            width: 24.h,
            height: 24.h,
          ),
        ),
      )
    ],
  );
}