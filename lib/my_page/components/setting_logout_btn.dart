import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingLogoutBtn extends StatelessWidget {
  final Function()? callBack;
  const SettingLogoutBtn({Key? key,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 20.w),
        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 7.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.h),
          color: Colors.white
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'images/my/setting_logout_icon.png',
              width: 20.h,
              height: 20.h,
            ),
            SizedBox(width: 4.w,),
            Text(
              'Log out',
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xFF333333)
              ),
            )
          ],
        ),
      ),
    );
  }
}
