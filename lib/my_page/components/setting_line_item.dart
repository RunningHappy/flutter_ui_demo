import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingLineItem extends StatelessWidget {
  final String title;
  final Function? callBack;
  const SettingLineItem({Key? key,required this.title,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(20.w, 6.h, 6.w, 6.h),
        margin: EdgeInsets.only(right: 125.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.h),
            bottomRight: Radius.circular(40.h)
          ),
          color: Color(0x20FFFFFF)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFFFFFFFF)
              ),
            ),
            Image.asset(
              'images/my/setting_right_icon.png',
              width: 30.h,
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
