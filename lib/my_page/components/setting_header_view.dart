import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingHeaderView extends StatelessWidget {
  final Function? callBack;
  const SettingHeaderView({Key? key,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 19.w,vertical: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.h),
          color: const Color(0x10FFFFFF)
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/activity/avatar_1.png',
                    width: 60.h,
                    height: 60.h,
                  ),
                  SizedBox(width: 14.w,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bruno Pham',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 4.h,),
                        Text(
                          'thanhphamdhbk@gmail.com',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFFC0C0C0)
                          ),
                        )
                      ],
                    )
                  )
                ],
              )
            ),
            SizedBox(width: 16.w,),
            GestureDetector(
              child: Image.asset(
                'images/my/setting_edit_icon.png',
                width: 30.h,
                height: 30.h,
              ),
            )
          ],
        ),
      ),
    );
  }
}
