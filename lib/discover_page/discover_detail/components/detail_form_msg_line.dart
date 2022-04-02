import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailFormMsgLine extends StatelessWidget {
  final Color? backColor;
  final String title;
  final String msg;
  final double? titleFont;
  final double? msgFont;
  final Color? titleColor;
  final Color? msgColor;
  const DetailFormMsgLine({Key? key,required this.title,required this.msg,this.backColor,this.titleFont,this.msgFont,this.titleColor,this.msgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: backColor??const Color(0xFFF1F1FE)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: titleFont??16.sp,
              color: titleColor??Colors.black,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(
            msg,
            style: TextStyle(
              fontSize: titleFont??14.sp,
              color: titleColor??const Color(0xFF8F90A7),
            ),
          )
        ],
      ),
    );
  }
}
