import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum CommonTextFieldType {
  normal,
  password,
}

class CommonTextField extends Container{
  TextEditingController controller;
  String? plaseText;
  double? fontSize;
  CommonTextFieldType? commonType;
  TextInputType? textInputType;
  Function(String)? callBack;
  List<TextInputFormatter>? inputFormatter;
  TextAlign? textAlign;
  CommonTextField({Key? key,required this.controller,this.plaseText,this.fontSize,this.commonType = CommonTextFieldType.normal,this.callBack,this.textInputType,this.inputFormatter,this.textAlign}) : super(key: key);
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 13.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.h),
        color: const Color(0xFFF3F5F7),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: fontSize ?? 16.sp,
                color: Colors.black
              ),
              textAlign: textAlign??TextAlign.left,
              keyboardType: textInputType,
              decoration: InputDecoration(
                isCollapsed: true, // 高度包裹
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: plaseText,
                hintStyle: TextStyle(
                  fontSize: fontSize ?? 16.sp,
                  color: const Color(0xFFBDBDBD),
                ),
              ),
              inputFormatters: inputFormatter,
              onChanged: (value) {
                callBack!(value);
              },
            )
          ),
          commonType == CommonTextFieldType.password ? Container(
            margin: EdgeInsets.only(left: 24.w),
            child: Image.asset(
              'images/login/eye_icon.png',
              height: 24.h,
              width: 24.h,
            ),
          ) : Container()
        ],
      ),
    );
  }
}