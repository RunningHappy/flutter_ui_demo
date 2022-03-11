import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_title_btn.dart';

class HomeDetailListItem extends StatelessWidget {
  final bool? showBtn;
  const HomeDetailListItem({Key? key,this.showBtn = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 14.w,bottom: 10.h,right: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: Color(0xFFF6F7F9)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('images/activity/avatar_1.png',width: 30.h,height: 30.h,),
          SizedBox(width: 14.w,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bruno Pham',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 4.h,),
                Text(
                  'Great shot! I love it',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFF212121)
                  ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          '2 mins ago',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xFF828282)
                          ),
                        ),
                        SizedBox(width: 20.w,),
                        Offstage(
                          offstage: showBtn!,
                          child: GestureDetector(
                            child: Text(
                              'Like',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Color(0xFF242424)
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Offstage(
                      offstage: showBtn!,
                      child: CommonImgTitleBtn(imgStr: 'images/home/home_detail_like_icon.png', title: '02')
                    )
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}
