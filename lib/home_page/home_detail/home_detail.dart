import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_right_actions_appbar.dart';
import 'package:new_project/home_page/components/home_item.dart';
import 'package:new_project/home_page/components/home_item_top.dart';
import 'package:new_project/home_page/home_detail/components/home_detail_action_view.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

import 'components/home_detail_list_item.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {

  var data = HomeListModel('images/home/item_1.png', 'Thanh Pham', '1 hour ago', '20', '125', 'images/home/home_item_header_1.png');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonRightActionsAppBar((){
        NavigatorUtil.closeWin(context);
      }, [
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(right: 20.w),
            child: Image.asset(
              'images/home/home_item_like.png',
              width: 24.h,
              height: 24.h,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(right: 20.w),
            child: Image.asset(
              'images/home/home_item_add.png',
              width: 24.h,
              height: 24.h,
              color: Colors.black,
            ),
          ),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(right: 16.w),
            child: Image.asset(
              'images/home/home_detail_share.png',
              width: 24.h,
              height: 24.h,
            ),
          ),
        ),
      ]),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                HomeItemTop(headerPath: data.headerPath,userName: data.userName,timeStr: data.timeStr,),
                Image.asset(
                  data.imgPath,
                  width: double.infinity,
                ),
                const HomeDetailActionsView(),
                SizedBox(height: 10.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Street portrait',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 6.h,),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus. ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF828282)
                              ),
                            )
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h,),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return const HomeDetailListItem();
                  }
                )
              ],
            )
          ),
          GestureDetector(
            onTap: (){
              NavigatorUtil.openWin(context, PageRoutes.detailMsgPage);
            },
            child: Container(
              padding: EdgeInsets.only(bottom: Platform.isIOS ? MediaQuery.of(context).padding.bottom : 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 12.h),
                child: Row(
                  children: [
                    Image.asset('images/activity/avatar_1.png',width: 30.h,height: 30.h,),
                    SizedBox(width: 14.w,),
                    Expanded(
                      child: Text(
                        'Add a comment',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFBDBDBD)
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
