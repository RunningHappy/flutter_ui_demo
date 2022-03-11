import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_title_btn.dart';

class MessageListModel{
  bool activity;
  MessageListModel(this.activity);
}

class MessageListItem extends StatelessWidget {
  final MessageListModel itemModel;
  const MessageListItem({Key? key,required this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 14.w,bottom: 10.h,right: 14.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.h),
        color: itemModel.activity ? Color(0xFFF1F1FE) : Color(0xFFF6F7F9)
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
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Great shot! I love it',
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: itemModel.activity ? Color(0xFF242424) : Color(0xFF212121)
                        ),
                      )
                    )
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '2 mins ago',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Color(0xFF828282)
                      ),
                    ),
                    CommonImgTitleBtn(imgStr: 'images/home/home_item_msg.png', title: '20')
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
