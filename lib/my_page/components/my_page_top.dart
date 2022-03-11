import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageTopView extends StatelessWidget {
  const MyPageTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/askpage/ask_top_back.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter
        )
      ),
      child: Container(
        child: Image.asset(
          'images/my/user_avatar_icon.png',
          width: 80.h,
          height: 80.h,
        ),
      ),
    );
  }
}
