import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTopView extends StatelessWidget {
  const DetailTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 23.25.h),
          child: Image.asset(
            'images/discover/detail_top_img.png',
            width: double.infinity,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 25.w,right: 25.w),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.h),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x0726292B),
                offset: Offset(0, 4.h),
                blurRadius: 40.w,
                spreadRadius: 0
              )
            ]
          ),
          alignment: Alignment.center,
          child: Text(
            'STREET NIGHT PORTRAIT',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500
            ),
          ),
        )
      ],
    );
  }
}
