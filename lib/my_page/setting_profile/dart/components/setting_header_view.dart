import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingHeaderView extends StatelessWidget {
  const SettingHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/askpage/ask_top_back.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter
        )
      ),
      child: Container(
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Image.asset(
              'images/my/user_avatar_icon.png',
              width: 80.h,
              height: 80.h,
            ),
            Image.asset(
              'images/my/setting_header_icon.png',
              width: 28.h,
              height: 28.h,
            ),
          ],
        ),
      ),
    );
  }
}
