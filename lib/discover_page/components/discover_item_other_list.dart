import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_title_btn_view.dart';
import 'package:new_project/discover_page/components/other_list_item.dart';

class OtherListModel{
  String title;
  String msg;
  OtherListModel(this.title,this.msg);
}

class DiscoverItemOtherList extends StatelessWidget {
  DiscoverItemOtherList({Key? key}) : super(key: key);
  
  List<OtherListModel> dataList = [
    OtherListModel('PORTRAIT PHOTOGRAPHY', '70 photos'),
    OtherListModel('MUSIC VIDEO', '10 videos'),
    OtherListModel('PORTRAIT PHOTOGRAPHY', '70 photos'),
    OtherListModel('MUSIC VIDEO', '10 videos'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.h),
      child: Column(
        children: [
          CommonTitleBtnView(title: 'Collection', btnTitle: 'View more'),
          SizedBox(height: 10.h,),
          Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 20.w),
            child: ListView.builder(
              itemCount: dataList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return OtherListItem(title: dataList[index].title, msg: dataList[index].msg);
              }
            ),
          )
        ],
      ),
    );
  }
}
