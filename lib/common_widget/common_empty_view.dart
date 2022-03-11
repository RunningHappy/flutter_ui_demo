import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonEmptyView extends Container{
  final String? title;
  final String path;
  double? imgWidth;
  double? imgHeight;
  double? fontSize;
  double? imgTitlePadding;
  Color? titleColor;
  double? paddingV;
  CommonEmptyView({Key? key,required this.path,this.title,this.imgWidth,this.imgHeight,this.fontSize,this.imgTitlePadding,this.titleColor,this.paddingV}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingV??48.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: imgTitlePadding??24.h),
            child: Image.asset(
              path,
              width: imgWidth??186.88.w,
              height: imgHeight??180.h,
            )
          ),
          Text(
            title??'',
            style: TextStyle(
              fontSize: fontSize??28.sp,
              color: titleColor??const Color(0xFFDBDBDB),
            ),
          )
        ],
      )
    );
  }
}
