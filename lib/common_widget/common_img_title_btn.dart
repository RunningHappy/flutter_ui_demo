import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonImgTitleBtn extends GestureDetector{
  String imgStr;
  String title;
  double? width;
  double? fontSize;
  Color? fontColor;
  double? imgTitlePadding;
  Function()? callBack;
  CommonImgTitleBtn({Key? key,required this.imgStr,required this.title,this.width,this.fontSize,this.fontColor,this.callBack,this.imgTitlePadding}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: fontSize??14.sp,
              color: fontColor??Color(0xFF828282)
            ),
          ),
          SizedBox(width: imgTitlePadding??6.w,),
          Image.asset(
            imgStr,
            width: width??20.h,
            height: width??20.h,
          ),
        ],
      ),
    );
  }
}