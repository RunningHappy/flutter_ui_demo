import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTitleBtnView extends Container{
  String title;
  double? titleFontSize;
  Color? titleFontColor;
  String btnTitle;
  double? btnTitleSize;
  Color? btnTitleColor;
  Function()? callBack;
  CommonTitleBtnView({Key? key,required this.title,required this.btnTitle,this.titleFontSize,this.titleFontColor,this.btnTitleSize,this.btnTitleColor,this.callBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 6.h),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFontSize??20.sp,
              color: titleFontColor??Colors.black,
              fontWeight: FontWeight.w700
            ),
          ),
          GestureDetector(
            child: Container(
              child: Text(
                btnTitle,
                style: TextStyle(
                  fontSize: btnTitleSize??14.sp,
                  color: btnTitleColor??Color(0xFF5151C6)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}