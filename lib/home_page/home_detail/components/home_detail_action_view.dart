import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_title_btn.dart';

class HomeDetailActionsView extends StatelessWidget {
  const HomeDetailActionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
      child: Row(
        children: [
          Expanded(
            child: CommonImgTitleBtn(imgStr: 'images/home/home_detail_look.png', title: '124',)
          ),
          Expanded(
            child: CommonImgTitleBtn(imgStr: 'images/home/home_item_msg.png', title: '20',)
          ),
          Expanded(
            child: CommonImgTitleBtn(imgStr: 'images/home/home_item_like.png', title: '125',)
          )
        ],
      ),
    );
  }
}
