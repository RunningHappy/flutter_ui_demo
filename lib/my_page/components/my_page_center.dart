import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class MyPageCenterView extends StatelessWidget {
  const MyPageCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w,vertical: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Bruno Pham',
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color(0xFF242424),
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 6.h,),
          Text(
            'Da Nang, Vietnam',
            style: TextStyle(
              fontSize: 16.sp,
              color: const Color(0xFF8F90A7),
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.h),
              color: const Color(0xFFF6F7F9)
            ),
            padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      NavigatorUtil.openWin(context, PageRoutes.myPageFollower);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '220',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFF242424),
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color(0xFFBDBDBD),
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '150',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFF242424),
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(width: 5.w,),
                      Text(
                        'Following',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: const Color(0xFFBDBDBD),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/my/my_page_internet_icon.png',
                width: 20.h,
                height: 20.h,
              ),
              Container(
                width: 6.h,
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.h),
                  color: const Color(0xFF888BF4)
                ),
              ),
              Image.asset(
                'images/my/my_page_instagram_icon.png',
                width: 20.h,
                height: 20.h,
              ),
              Container(
                width: 6.h,
                height: 6.h,
                margin: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.h),
                  color: const Color(0xFF888BF4)
                ),
              ),
              Image.asset(
                'images/my/my_page_facebook_icon.png',
                width: 20.h,
                height: 20.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
