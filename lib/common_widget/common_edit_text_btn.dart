import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';

class CommonEditTextBtn extends Container{
  TextEditingController controller;
  String? plaseText;
  double? fontSize;
  TextInputType? textInputType;
  Function(String)? callBack;
  List<TextInputFormatter>? inputFormatter;
  TextAlign? textAlign;
  String btnTitle;
  CommonEditTextBtn({Key? key,required this.controller,this.plaseText,this.fontSize,this.callBack,this.textInputType,this.inputFormatter,this.textAlign,required this.btnTitle}) : super(key: key);
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 56.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: fontSize ?? 14.sp,
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
                  fontSize: fontSize ?? 14.sp,
                  color: const Color(0xFFBDBDBD),
                ),
              ),
              inputFormatters: inputFormatter,
              onChanged: (value) {
                callBack!(value);
              },
            )
          ),
          SizedBox(
            width: 47.w,
            height: 32.w,
            child: CommonLinearBtn(title: btnTitle),
          ),
        ],
      ),
    );
  }
}