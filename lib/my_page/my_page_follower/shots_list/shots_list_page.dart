import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_project/common_widget/common_trans_appbar.dart';
import 'package:new_project/utils/navigator_util.dart';

class ShotsListPage extends StatefulWidget {
  const ShotsListPage({Key? key}) : super(key: key);

  @override
  _ShotsListPageState createState() => _ShotsListPageState();
}

class _ShotsListPageState extends State<ShotsListPage> {

  List<String> dataList = [
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonTansAppBar(1,(){
        NavigatorUtil.closeWin(context);
      },fontSize: 20.sp,fontWeight: FontWeight.w700,title: 'Title',backIconColor: Colors.transparent),
      body: MasonryGridView.count(
        padding: EdgeInsets.symmetric(horizontal: 23.w,vertical: 12.h),
        itemCount: dataList.length,
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 20.w,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10.h),
            child: Image.asset(
              dataList[index],
              width: double.infinity,
            ),
          );
        },
      ),
    );
  }
}
