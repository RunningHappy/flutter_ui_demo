import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

CommonSearchBar(
  TextEditingController controller,
  String? plaseText,
  {double? fontSize,
  Function(String)? callBack,
  Function()? tapTextField,
  bool? showRightBtn = true,
  bool? enable = true,
  FocusNode? focusNode,
  bool? showCancle = false,
  Function()? clickCancle}){

  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 0,
    title: showRightBtn! ? Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              if(!enable!){
                if(tapTextField != null){
                  tapTextField();
                }
              }
            },
            child: Container(
              height: 37.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: Color(0xFFF3F5F7)
              ),
              child: Row(
                children: [
                  Image.asset('images/searchappbar/search_icon.png',height: 20.h,width: 20.h,),
                  SizedBox(width: 6.w,),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: fontSize ?? 14.sp,
                        color: Colors.black
                      ),
                      enabled: enable!,
                      decoration: InputDecoration(
                        isCollapsed: true, // 高度包裹
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: plaseText,
                        hintStyle: TextStyle(
                          fontSize: fontSize ?? 14.sp,
                          color: const Color(0xFFBDBDBD),
                        ),
                      ),
                      onChanged: (value) {
                        callBack!(value);
                      },
                    )
                  )
                ],
              ),
            ),
          )
        ),
        SizedBox(width: 16.w,),
        Image.asset('images/searchappbar/msg_icon.png',width: 36.h,height: 36.h,)
      ],
    ) : Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: (){
              if(!enable!){
                if(tapTextField != null){
                  tapTextField();
                }
              }
            },
            child: Container(
              height: 37.h,
              padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 8.5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: Color(0xFFF3F5F7),
                border: Border.all(
                  width: showCancle! ? 1.w : 0,
                  color: showCancle ? Color(0xFF5151C6) : Colors.transparent
                )
              ),
              child: Row(
                children: [
                  Image.asset('images/searchappbar/search_icon.png',height: 20.h,width: 20.h,),
                  SizedBox(width: 6.w,),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                        fontSize: fontSize ?? 14.sp,
                        color: Colors.black
                      ),
                      enabled: enable!,
                      focusNode: focusNode!,
                      decoration: InputDecoration(
                        isCollapsed: true, // 高度包裹
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: plaseText,
                        hintStyle: TextStyle(
                          fontSize: fontSize ?? 14.sp,
                          color: const Color(0xFFBDBDBD),
                        ),
                      ),
                      onChanged: (value) {
                        callBack!(value);
                      },
                    )
                  )
                ],
              ),
            ),
          )
        ),
        Offstage(
          offstage: showCancle ? false : true,
          child: GestureDetector(
            onTap: (){
              if(clickCancle != null){
                clickCancle();
              }
            },
            child: Container(
              child: Row(
                children: [
                  SizedBox(width: 16.w,),
                  Text(
                    'Cancle',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );
}