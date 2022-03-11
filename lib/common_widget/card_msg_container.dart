import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardMsgContainer extends Container{
  String title;
  double? fontSize;
  Color? titleColor;
  double? radius;
  Color? backColor;
  FontWeight? fontWeight;
  double? paddingH;
  double? paddingV;
  Function()? callBack;
  CardMsgContainer({Key? key,required this.title,this.fontSize,this.callBack,this.titleColor,this.fontWeight,this.backColor,this.radius,this.paddingV,this.paddingH}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingH??24.w,vertical: paddingV??16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius??12.h),
        color: backColor??const Color(0xFFF1F1FE)
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize??18.sp,
                color: titleColor??Colors.black,
                fontWeight: fontWeight??FontWeight.w500
              ),
            )
          )
        ],
      ),
    );
  }
}