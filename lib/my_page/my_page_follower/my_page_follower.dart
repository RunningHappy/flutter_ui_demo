import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_project/common_widget/common_empty_view.dart';
import 'package:new_project/common_widget/common_line_border_btn.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/common_widget/common_segment.dart';
import 'package:new_project/common_widget/common_trans_appbar.dart';
import 'package:new_project/my_page/components/my_page_center.dart';
import 'package:new_project/my_page/components/my_page_grid_item.dart';
import 'package:new_project/my_page/components/my_page_top.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class MyPageFollower extends StatefulWidget {
  const MyPageFollower({Key? key}) : super(key: key);

  @override
  _MyPageFollowerState createState() => _MyPageFollowerState();
}

class _MyPageFollowerState extends State<MyPageFollower> {

  ScrollController listController = ScrollController();

  var opactity = 0.0;

  var selectIndex = 0;

  List<TitleModel> titleList = [
    TitleModel('0 shots', true),
    TitleModel('10 Collections', false),
  ];

  List<MyPageGridModel> dataList = [
    MyPageGridModel('YOUR LIKES', '25 shots'),
    MyPageGridModel('DOWNLOAD', '25 shots'),
    MyPageGridModel('PORTRAIT PHOTOGRAPHY', '25 shots'),
    MyPageGridModel('PORTRAIT PHOTOGRAPHY', '25 shots'),
    MyPageGridModel('PORTRAIT PHOTOGRAPHY', '25 shots'),
    MyPageGridModel('PORTRAIT PHOTOGRAPHY', '25 shots'),
  ];

  List<String> dataList1 = [
    'images/discover/detail_man_1.png',
    'images/discover/detail_woman.png',
    'images/discover/detail_man_2.png',
    'images/discover/other_list_left_img.png',
    'images/discover/other_list_right_img.png',
    'images/discover/detail_top_img.png',
    'images/discover/first_list_1_img.png',
    'images/discover/first_list_2_img.png',
    'images/discover/other_list_top_img.png',
    'images/discover/search_view_1_img.png',
    'images/discover/search_view_2_img.png',
    'images/discover/search_view_3_img.png',
    'images/discover/search_view_4_img.png',
  ];

  @override
  void initState() {
    // TODO: implement initStateDOWNLOAD
    super.initState();
    listController.addListener(() {
      if(listController.offset / 200.h > 1){
        setState(() {
          opactity = 1;
        });
      }else{
        setState(() {
          opactity = listController.offset / 200.h;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CommonTansAppBar(opactity, (){
        NavigatorUtil.closeWin(context);
      },title: '@brunopham',fontSize: 14.sp,showBack: true,actions: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
          child: CommonLineBorderBtn(title: 'Follow',width: 73.w,lineColor: Colors.white,height: 36.h,),
        ),
      ],backIconColor: Colors.transparent),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              controller: listController,
              padding: EdgeInsets.all(0),
              children: [
                const MyPageTopView(),
                const MyPageCenterView(),
                CommonSegment(
                  titleList: titleList,
                  normalColor: Color(0xFFBDBDBD),
                  selectColor: Color(0xFF888BF4),
                  normalBackColor: Colors.transparent,
                  selectBackColor: Color(0xFFF1F1FE),
                  itemWidth: (MediaQuery.of(context).size.width - 30.w) / 2,
                  callBack: (index){
                    for(var item in titleList){
                      item.select = false;
                    }
                    setState(() {
                      titleList[index].select = true;
                      selectIndex = index;
                    });
                  },
                ),
                dataList.isNotEmpty ? selectIndex == 0 ?
                MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                  itemCount: dataList1.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 15.w,
                  crossAxisSpacing: 15.h,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(10.h),
                      child: Image.asset(
                        dataList1[index],
                        width: double.infinity,
                      ),
                    );
                  },
                ) : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dataList.length,
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 16.h),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                      crossAxisCount: 2,
                      //纵轴间距
                      mainAxisSpacing: 16.h,
                      //横轴间距
                      crossAxisSpacing: 19.h,
                      //子组件宽高长度比例
                      childAspectRatio: 158.w / 185.h
                    ),
                    itemBuilder: (context,index){
                      return MyPageGridItem(itemModel: dataList[index],callBack: (){
                        NavigatorUtil.openWin(context, PageRoutes.shotsListPage);
                      },);
                    }) :
                CommonEmptyView(path: 'images/my/empty_icon.png')
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(bottom: Platform.isIOS ? MediaQuery.of(context).padding.bottom : 0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonLinearBtn(title: 'Donate',width: 157.5.w,height: 36.h,fontSize: 14.sp,fontWeight: FontWeight.normal,),
                  CommonLineBorderBtn(title: 'Message',width: 157.5.w,height: 36.h,fontSize: 14.sp,callBack: (){
                    NavigatorUtil.openWin(context, PageRoutes.messagePage);
                  },)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
