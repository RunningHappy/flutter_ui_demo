import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonImgBtn extends GestureDetector{
  String imgStr;
  double? width;
  Function()? callBack;
  CommonImgBtn({Key? key,required this.imgStr,this.width,this.callBack}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Image.asset(
        imgStr,
        width: width??40.h,
        height: width??40.h,
      ),
    );
  }
}