import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
  final List<Widget> _pageList = [HomePage(),DiscoverPage(),ActivityPage(),MyPage()];

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<bool> onWillPop() async {
    if(_lastPopTime == null || DateTime.now().difference(_lastPopTime!) > const Duration(seconds: 2)) {
      _lastPopTime = DateTime.now();
      EasyLoading.showToast('再按一次退出');
    } else {
      _lastPopTime = DateTime.now();
      // 退出app
      // AppAndroidBackTop.backDeskTop();
      await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: _pageList[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Image.asset(
          'images/bottombar/tab_bar_center_icon.png',
        ),
        onPressed: (){

        },
      ),
      bottomNavigationBar: Container(
        height: 65.h,
        color: Colors.transparent,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.h,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildBarItem(0, _currentIndex),
              buildBarItem(1, _currentIndex),
              buildBarItem(-1, _currentIndex),
              buildBarItem(2, _currentIndex),
              buildBarItem(3, _currentIndex)
            ],
          ),
        ),
      ),
    );
  }

  buildBarItem(int? index,int? selectIndex){
    return Expanded(
      child: GestureDetector(
        onTap: (){
          setState(() {
            _currentIndex = index!;
          });
        },
        child: index! == -1 ? Container() : Container(
          color: Colors.transparent,
          child: Image.asset(
            selectIndex == index ? 'images/bottombar/tab_bar_${index + 1}_select.png' : 'images/bottombar/tab_bar_${index + 1}_normal.png',
            width: 24.h,
            height: 24.h,
          ),
        ),
      )
    );
  }
}
