import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/activity_page/activity_page.dart';
import 'package:new_project/discover_page/discover_page.dart';
import 'package:new_project/home_page/home_page.dart';
import 'package:new_project/my_page/my_page.dart';

/// 底部tabBar
class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  _BottomTabBarState createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {

  /// 当前页面的索引
  int _currentIndex = 0;
  DateTime? _lastPopTime;
  final List<Widget> _pageList = [const HomePage(),const DiscoverPage(),const ActivityPage(),const MyPage()];
  final List<String> normalImage = ['images/bottombar/tab_bar_1_normal.png','images/bottombar/tab_bar_2_normal.png','images/bottombar/tab_bar_3_normal.png','images/bottombar/tab_bar_4_normal.png'];
  final List<String> activeImage = ['images/bottombar/tab_bar_1_select.png','images/bottombar/tab_bar_2_select.png','images/bottombar/tab_bar_3_select.png','images/bottombar/tab_bar_4_select.png'];
  // final List<String> titles = ['首页','发现','消息','我的'];
  final List<String> titles = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CenterFloatingBottomBar(
      pageList: _pageList,
      centerImage: 'images/bottombar/tab_bar_center_icon.png',
      normalBarImage: normalImage,
      activeBarImage: activeImage,
      barTitleList: titles,
      normalTitleSize: 10.sp,
      activeTitleSize: 10.sp,
      imageTitlePadding: 3.h,
      imageWidth: 24.h,
      barHeight: 56.h,
    );
  }
}
