import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_line_border_btn.dart';

class ActivityItemModel{
  String avatar;
  String userName;
  String msg;
  String timeStr;
  bool isRead;
  bool itemType;
  bool msgType;
  ActivityItemModel(this.avatar,this.userName,this.timeStr,this.msg,this.itemType,this.isRead,this.msgType);
}

class ActivityItem extends StatefulWidget {
  final ActivityItemModel itemModel;
  const ActivityItem({Key? key,required this.itemModel}) : super(key: key);

  @override
  _ActivityItemState createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.fromLTRB(16.w, 14.h, 14.w, 14.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.h),
        color: widget.itemModel.isRead ? const Color(0xFFF6F7F9) : const Color(0xFFF1F1FE)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.itemModel.avatar,
                  width: 30.h,
                  height: 30.h,
                ),
                SizedBox(width: 14.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.itemModel.userName,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 4.h,),
                      Row(
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: widget.itemModel.msgType ? 'liked' : 'added',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.black
                                    ),
                                  ),
                                  TextSpan(
                                    text: widget.itemModel.msg,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF888BF4)
                                    ),
                                  ),
                                ]
                              )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Text(
                        widget.itemModel.timeStr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFFBDBDBD)
                        ),
                      )
                    ],
                  )
                )
              ],
            )
          ),
          SizedBox(width: 14.w,),
          widget.itemModel.itemType ? Container(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 9.h,top: 9.h),
                  child: Image.asset(
                    'images/activity/activity_item_img.png',
                    width: 80.5.w,
                  ),
                ),
                Image.asset(
                  'images/activity/avtivity_like_img.png',
                  width: 18.h,
                  height: 19.h,
                )
              ],
            ),
          ) : CommonLineBorderBtn(title: 'Follow')
        ],
      ),
    );
  }
}
