import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleContent extends Container{
  String data;
  double? fontSize;
  Color? fontColor;
  TitleContent({Key? key,required this.data,this.fontSize,this.fontColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      data,
      style: TextStyle(
        fontSize: fontSize??16.sp,
        color: fontColor??const Color(0xFF888BF4),
        fontWeight: FontWeight.w600
      ),
    );
  }
}