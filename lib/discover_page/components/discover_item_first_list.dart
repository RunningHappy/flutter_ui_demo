import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_title_btn_view.dart';
import 'package:new_project/discover_page/components/first_list_item.dart';

class FirstListModel{
  String imgPath;
  String title;
  FirstListModel(this.imgPath,this.title);
}

class DiscoverItemFirstList extends StatelessWidget {
  DiscoverItemFirstList({Key? key}) : super(key: key);

  List<FirstListModel> dataList = [
    FirstListModel('images/discover/first_list_1_img.png', 'PHOTOGRAPHY'),
    FirstListModel('images/discover/first_list_2_img.png', 'UI DESIGN'),
    FirstListModel('images/discover/first_list_1_img.png', 'PHOTOGRAPHY'),
    FirstListModel('images/discover/first_list_2_img.png', 'UI DESIGN'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          CommonTitleBtnView(title: 'Topic', btnTitle: 'View more'),
          SizedBox(height: 10.h,),
          Container(
            height: 100.h,
            padding: EdgeInsets.only(left: 20.w),
            child: ListView.builder(
              itemCount: dataList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return FirstListItem(imagePath: dataList[index].imgPath, title: dataList[index].title);
              }
            ),
          )
        ],
      ),
    );
  }
}
