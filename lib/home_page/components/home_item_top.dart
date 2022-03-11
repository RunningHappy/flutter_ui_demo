import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItemTop extends StatelessWidget {
  final String? headerPath;
  final String? userName;
  final String? timeStr;
  const HomeItemTop({Key? key,this.headerPath,this.userName,this.timeStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.h),
          topRight: Radius.circular(10.h)
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                headerPath!,
                width: 30.h,
                height: 30.h,
              ),
              SizedBox(width: 10.w,),
              Text(
                userName!,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color(0xFF242424),
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
          Text(
            timeStr!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFFBDBDBD)
            ),
          )
        ],
      ),
    );
  }
}
