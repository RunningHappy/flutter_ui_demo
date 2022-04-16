import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HeroNextPage extends StatefulWidget {
  const HeroNextPage({Key? key}) : super(key: key);

  @override
  _HeroNextPageState createState() => _HeroNextPageState();
}

class _HeroNextPageState extends State<HeroNextPage> {

  var opactity = 0.0;

  PanelController _pc = new PanelController();

  List<String> imageList = [
    'images/askpage/ask_content_1.png',
    'images/askpage/ask_content_2.png',
    'images/askpage/ask_content_3.png',
    'images/askpage/ask_content_4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanelViewFrame(
      title: '@brunopham',
      rightActions: [
        CommonImgBtn(imgStr: 'images/home/home_item_add.png',width: 24.h,callBack: (){
          _pc.open();
        },),
        SizedBox(width: 20.w,),
        CommonImgBtn(imgStr: 'images/home/home_detail_share.png',width: 24.h,callBack: (){
          _pc.close();
        },),
        SizedBox(width: 16.w,),
      ],
      opactity: opactity,
      backIconPath: 'images/discover/detail_back_icon.png',
      topTapView: _floatingPanel(),
      contentView: _floatingCollapsed(),
      controller: _pc,
      body: ListView(
        padding: EdgeInsets.only(bottom: 35.h),
        children: [
          SizedBox(
            height: 220.h,
            child: CommonBanner(
              imageList: imageList,
              children: imageList.map((e) => Image.asset(
                  e,
                  fit: BoxFit.cover,
                ),
              ).toList(),
              paginationPaddingH: 10.w,
              paginationPaddingV: 10.h,
              activePagination: Container(
                width: 8.w,
                height: 8.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Colors.redAccent
                ),
              ),
              normalPagination: Container(
                width: 8.w,
                height: 8.w,
                margin: EdgeInsets.only(right: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.w),
                  color: Colors.grey
                ),
              ),
              tapImageBack: (index){

              },
            ),
          ),
          SizedBox(height: 10.h,),
          Hero(
            tag: 'heroTag',
            child: Image.asset(
              'images/askpage/ask_content_1.png',
              width: double.infinity,
            )
          ),
          SizedBox(height: 10.h,),
          Hero(
            tag: 'heroTag1',
            child: Image.asset(
              'images/askpage/ask_content_2.png',
              width: double.infinity,
            )
          )
        ],
      ),
    );
  }
}

Widget _floatingCollapsed(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(5.w), topRight: Radius.circular(5.w)),
    ),
    child: Center(
      child: Container(
        width: 100.w,
        height: 5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.h),
          color: Colors.black
        ),
      ),
    ),
  );
}

Widget _floatingPanel(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5.w),
        topRight: Radius.circular(5.w)
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 10.w,
          color: Colors.grey,
        ),
      ]
    ),
    child: Column(
      children: [
        SizedBox(height: 10.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '内容',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.all(0),
            itemBuilder: (context,index){
              return ListTile(
                leading: Icon(
                  Icons.map,
                  size: 15.sp,
                  color: Colors.black,
                ),
                title: Text(
                  'Title',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700
                  ),
                ),
                subtitle: Text(
                  'SubTitle',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_outlined,
                  size: 15.sp,
                  color: Colors.black,
                ),
              );
            }
          )
        )
      ],
    ),
  );
}
