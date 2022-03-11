import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailCenterTitle extends StatelessWidget {
  final String title;
  const DetailCenterTitle({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 6.h,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: Color(0xFF888BF4)
            ),
          ),
          SizedBox(width: 24.w,),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(width: 24.w,),
          Container(
            width: 6.h,
            height: 6.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.h),
              color: Color(0xFF888BF4)
            ),
          )
        ],
      ),
    );
  }
}
