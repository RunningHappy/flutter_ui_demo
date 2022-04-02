import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FirstListItem extends StatelessWidget {
  final String imagePath;
  final String title;
  const FirstListItem({Key? key,required this.imagePath,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.w),
            child: Image.asset(
              imagePath,
              width: 150.w,
              height: 100.h,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: 100.h,
            width: 150.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: const Color(0x50171717)
            ),
            alignment: Alignment.center,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700
              ),
            ),
          )
        ],
      ),
    );
  }
}
