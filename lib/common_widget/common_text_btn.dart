import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonTextBtn extends GestureDetector{
  String title;
  double? fontSize;
  Color? fontColor;
  Function()? callBack;
  CommonTextBtn({Key? key,required this.title,this.fontSize,this.callBack,this.fontColor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize??16.sp,
          color: fontColor??Color(0xFF5252C7)
        ),
      ),
    );
  }
}