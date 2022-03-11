import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtherListItem extends StatelessWidget {
  final String title;
  final String msg;
  const OtherListItem({Key? key,required this.title,required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 158.h,
                height: 158.h,
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.w),
                          topLeft: Radius.circular(10.w)
                        ),
                        child: Image.asset(
                          'images/discover/other_list_top_img.png',
                        ),
                      )
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.w)
                              ),
                              child: Image.asset(
                                'images/discover/other_list_left_img.png',
                              ),
                            )
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.w)
                              ),
                              child: Image.asset(
                                'images/discover/other_list_right_img.png',
                              ),
                            )
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),
              Container(
                height: 158.h,
                width: 158.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: Color(0x50171717)
                ),
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w700
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  msg,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xFF828282)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
