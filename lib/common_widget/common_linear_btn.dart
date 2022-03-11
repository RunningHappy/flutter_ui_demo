import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonLinearBtn extends GestureDetector{
  String title;
  double? fontSize;
  Color? titleColor;
  double? width;
  double? height;
  Alignment? linearStart;
  Alignment? linearEnd;
  double? radius;
  List<Color>? linearColors;
  FontWeight? fontWeight;
  Function()? callBack;
  CommonLinearBtn({Key? key,
    required this.title,
    this.fontSize,
    this.width,
    this.callBack,
    this.height,
    this.fontWeight,
    this.linearStart,
    this.linearEnd,
    this.linearColors,
    this.titleColor}) :
        super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Container(
        height: height??52.h,
        width: width??315.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??30.h),
          gradient: LinearGradient(
            begin: linearStart??Alignment.centerLeft,
            end: linearEnd??Alignment.centerRight,
            colors: linearColors??[const Color(0xFF5151C6),const Color(0xFF888BF4)]
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize??16.sp,
                color: titleColor??Colors.white,
                fontWeight: fontWeight??FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }
}