import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CommonRightActionsAppBar(Function()? clickBack,List<Widget> actions){

  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leadingWidth: 50.w,
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
          color: const Color(0x20FFFFFF)
        ),
        child: Image.asset(
          'images/discover/detail_back_icon.png',
          width: 24.w,
          height: 24.w,
          color: Colors.black,
        ),
      ),
    ),
    actions: actions,
  );
}