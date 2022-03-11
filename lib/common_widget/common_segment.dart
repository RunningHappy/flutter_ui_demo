import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleModel {
  String title;
  bool select;
  TitleModel(this.title,this.select);
}

class CommonSegment extends Container{
  BuildContext context;
  List<TitleModel> titleList;
  double? fontSize;
  Color? normalColor;
  Color? selectColor;
  Color? normalBackColor;
  Color? selectBackColor;
  double? itemWidth;
  double? itemHeight;
  double? height;
  Function(dynamic)? callBack;
  CommonSegment({Key? key,this.height,required this.context,required this.titleList,this.itemWidth,this.itemHeight,this.fontSize,this.callBack,this.normalColor,this.selectColor,this.normalBackColor,this.selectBackColor,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(0.w, 6.h, 0, 6.h),
      height: height??51.h,
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10.w),
        itemCount: titleList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              callBack!(index);
            },
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              width: itemWidth??118.w,
              height: itemHeight??39.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.h),
                color: titleList[index].select ? selectBackColor : normalBackColor
              ),
              child: Text(
                titleList[index].title,
                style: TextStyle(
                  fontSize: fontSize??16.sp,
                  color: titleList[index].select ? selectColor : normalColor
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}