import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_search_bar.dart';
import 'package:new_project/discover_page/components/discover_item_first_list.dart';
import 'package:new_project/discover_page/components/discover_item_other_list.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonSearchBar(search,'Search',enable: false, tapTextField: (){
        NavigatorUtil.openWin(context, PageRoutes.discoverSearchPage);
      }),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.only(top: 20.h,bottom: 75.h),
          children: [
            DiscoverItemFirstList(),
            DiscoverItemOtherList(),
            DiscoverItemOtherList()
          ],
        ),
      ),
    );
  }
}
