import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskTopView extends StatelessWidget {
  const AskTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 139.h,
      padding: EdgeInsets.only(top: 76.74.h),
      margin: EdgeInsets.only(bottom: 40.h),
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('images/askpage/ask_top_back.png'),
          fit: BoxFit.fill
        )
      ),
      child: Image.asset(
        'images/splash/text_icon.png',
        width: 80.w,
        height: 27.12.h,
      ),
    );
  }
}
