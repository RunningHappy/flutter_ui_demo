import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailImagesView extends StatelessWidget {
  final String leftImage;
  final String rightImage;
  const DetailImagesView({Key? key,required this.leftImage,required this.rightImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      margin: EdgeInsets.only(top: 16.h),
      child: Row(
        children: [
          Expanded(
            child: Image.asset(
              leftImage,
            )
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Image.asset(
              rightImage,
            )
          ),
        ],
      ),
    );
  }
}
