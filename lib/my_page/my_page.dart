import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_project/common_widget/common_empty_view.dart';
import 'package:new_project/my_page/components/my_page_center.dart';
import 'package:new_project/my_page/components/my_page_grid_item.dart';
import 'package:new_project/my_page/components/my_page_top.dart';
import 'package:new_project/my_page/components/setting_drawer_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with SingleTickerProviderStateMixin{

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
    return SettingDrawerPage(
      mainBody: GestureDetector(
        onTap: (){
          // z.close!();
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: CommonTansAppBar(opactity, (){

          },title: '@brunopham',fontSize: 14.sp,showBack: false,actions: [
            GestureDetector(
              onTap: (){
                bus.emit('openDrawer');
              },
              child: Container(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(
                  'images/activity/activity_setting_icon.png',
                  width: 24.h,
                  height: 24.h,
                  color: opactity > 0.4 ? Color.fromRGBO(0, 0, 0, opactity) : Colors.white,
                ),
              ),
            ),
          ],backIconPath: ''),
          body: ListView(
            controller: listController,
            padding: EdgeInsets.only(bottom: 65.h),
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
                  return GestureDetector(
                    onTap: (){
                      CommonSeeImageView.preview(context, images: dataList1, initialIndex: index,downLoad: (selectIndex){

                      });
                    },
                    child: Hero(
                      tag: index,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.h),
                        child: Image.asset(
                          dataList1[index],
                          width: double.infinity,
                        ),
                      )
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
                  return MyPageGridItem(itemModel: dataList[index],);
                }
              ) : CommonEmptyView(path: 'images/my/empty_icon.png')
            ],
          ),
        ),
      )
    );
  }
}
