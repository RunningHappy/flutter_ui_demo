import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonLineBorderBtn extends GestureDetector{
  String title;
  double? fontSize;
  double? width;
  double? height;
  Color? lineColor;
  Color? fontColor;
  Color? backColor;
  Function()? callBack;
  CommonLineBorderBtn({Key? key,required this.title,this.fontSize,this.width,this.callBack,this.height,this.lineColor,this.fontColor,this.backColor}) : super(key: key);
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
        height: height??32.h,
        width: width??61.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.h),
          border: Border.all(
            width: 1.h,
            color: lineColor??const Color(0xFF888BF4)
          ),
          color: backColor??Colors.white
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize??14.sp,
                color: fontColor??const Color(0xFF888BF4),
              ),
            )
          ],
        ),
      ),
    );
  }
}