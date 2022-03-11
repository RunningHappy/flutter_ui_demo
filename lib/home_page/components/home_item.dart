import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/home_page/components/home_item_bottom.dart';
import 'package:new_project/home_page/components/home_item_top.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class HomeListModel{
  String imgPath;
  String userName;
  String timeStr;
  String msgCount;
  String likeCount;
  String headerPath;
  HomeListModel(this.imgPath,this.userName,this.timeStr,this.msgCount,this.likeCount,this.headerPath);
}

class HomeItem extends StatelessWidget {
  final HomeListModel? itemModel;
  const HomeItem({Key? key,this.itemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigatorUtil.openWin(context, PageRoutes.homeDetail);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        child: Column(
          children: [
            HomeItemTop(headerPath: itemModel!.headerPath,userName: itemModel!.userName,timeStr: itemModel!.timeStr,),
            Image.asset(
              itemModel!.imgPath,
              width: double.infinity,
            ),
            HomeItemBottom(msgCount: itemModel!.msgCount,likeCount: itemModel!.likeCount,)
          ],
        ),
      ),
    );
  }
}
