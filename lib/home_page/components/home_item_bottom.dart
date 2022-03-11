import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:new_project/common_widget/common_img_title_btn.dart';

class HomeItemBottom extends StatelessWidget {
  final String? msgCount;
  final String? likeCount;
  const HomeItemBottom({Key? key,this.msgCount,this.likeCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10.h),
          bottomRight: Radius.circular(10.h)
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonImgBtn(imgStr: 'images/home/home_item_add.png',width: 20.w,),
          Row(
            children: [
              CommonImgTitleBtn(imgStr: 'images/home/home_item_msg.png', title: msgCount!),
              SizedBox(width: 16.w,),
              CommonImgTitleBtn(imgStr: 'images/home/home_item_like.png', title: likeCount!),
            ],
          )
        ],
      ),
    );
  }
}
