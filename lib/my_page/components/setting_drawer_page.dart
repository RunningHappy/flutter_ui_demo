import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:new_project/my_page/components/setting_header_view.dart';
import 'package:new_project/my_page/components/setting_line_item.dart';
import 'package:new_project/my_page/components/setting_logout_btn.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';
import 'package:app_assembly/app_assembly.dart';

class SettingDrawerPage extends StatefulWidget {
  final Widget mainBody;
  const SettingDrawerPage({Key? key,required this.mainBody}) : super(key: key);

  @override
  _SettingDrawerPageState createState() => _SettingDrawerPageState();
}

class _SettingDrawerPageState extends State<SettingDrawerPage> {

  final ZoomDrawerController z = ZoomDrawerController();

  List<String> settingList = [
    'Email',
    'Instagram',
    'Twitter',
    'Website',
    'Paypal',
    'Change password',
    'About i.click',
    'Terms & privacy'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBus();
  }

  initBus() {
    bus.on('openDrawer', (arg) {
      if(mounted){
        z.toggle!();
      }
    });
    // bus.on('closeDrawer', (arg) {
    //   if(mounted){
    //     z.close!();
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    bus.off('openDrawer');
    // bus.off('closeDrawer');
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: z,
      borderRadius: 24,
      style: DrawerStyle.Style1,
      openCurve: Curves.fastLinearToSlowEaseIn,
      disableGesture: false,
      mainScreenTapClose: true,
      mainScreenScale: 0.9,
      slideWidth: MediaQuery.of(context).size.width - 15.w,
      duration: const Duration(milliseconds: 500),
      backgroundColor: Colors.white,
      showShadow: false,
      angle: 0.0,
      clipMainScreen: false,
      mainScreen: widget.mainBody,
      menuScreen: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,bottom: MediaQuery.of(context).padding.bottom + 50.h),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/home/zoom_back_image.png'),
              fit: BoxFit.fill
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingHeaderView(
                callBack: (){
                  z.close!();
                  NavigatorUtil.openWin(context, PageRoutes.settingProfile);
                },
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 8.h,bottom: 30.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: settingList.map<Widget>((e) => SettingLineItem(title: e,callBack: (){
                      z.close!();
                      if(settingList.indexOf(e) == 1){
                        NavigatorUtil.openWin(context, PageRoutes.settingDemoPage);
                      }else{
                        NavigatorUtil.openWin(context, PageRoutes.settingChildPage);
                      }
                    },)).toList(),
                  ),
                ),
              ),
              SettingLogoutBtn(callBack: (){
                NavigatorUtil.openWinCloseToALl(context, PageRoutes.loginPage);
              },)
            ],
          ),
        ),
      ),
    );
  }
}
