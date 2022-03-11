import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_trans_appbar.dart';
import 'package:new_project/discover_page/discover_detail/components/detail_center_title.dart';
import 'package:new_project/discover_page/discover_detail/components/detail_form_view.dart';
import 'package:new_project/discover_page/discover_detail/components/detail_imags_view.dart';
import 'package:new_project/discover_page/discover_detail/components/detail_top_view.dart';
import 'package:new_project/utils/navigator_util.dart';

class DiscoverDetailPage extends StatefulWidget {
  const DiscoverDetailPage({Key? key}) : super(key: key);

  @override
  _DiscoverDetailPageState createState() => _DiscoverDetailPageState();
}

class _DiscoverDetailPageState extends State<DiscoverDetailPage> {

  ScrollController listController = ScrollController();

  var opactity = 0.0;

  @override
  void initState() {
    // TODO: implement initState
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
      appBar: CommonTansAppBar(opactity,(){
        NavigatorUtil.closeWin(context);
      }),
      body: ListView(
        padding: EdgeInsets.all(0),
        controller: listController,
        children: [
          DetailTopView(),
          DetailFormView(),
          SizedBox(height: 44.h,),
          DetailCenterTitle(title: 'Challenge'),
          SizedBox(height: 16.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xFF586274)
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus. Eget dictumst vitae enim, felis morbi. Quis risus, neque cursus risus.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xFF586274)
              ),
            ),
          ),
          SizedBox(height: 40.h,),
          DetailCenterTitle(title: 'Inspiration'),
          DetailImagesView(leftImage: 'images/discover/detail_man_2.png', rightImage: 'images/discover/detail_man_1.png'),
          SizedBox(height: 40.h,),
          DetailCenterTitle(title: 'Trending'),
          DetailImagesView(leftImage: 'images/discover/detail_woman.png', rightImage: 'images/discover/detail_woman.png'),
          SizedBox(height: 60.h,),
        ],
      ),
    );
  }
}
