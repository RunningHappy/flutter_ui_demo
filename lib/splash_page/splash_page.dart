import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';
import 'package:new_project/utils/share_preferences_util.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      _getSplashType();
    });
  }

  _getSplashType() async {
    SpUtil? spUtil = await SpUtil.instance;
    var temp = spUtil!.getBool('splashType') == null ? false : spUtil.getBool('splashType') == false ? false : true;
    if(temp){
      NavigatorUtil.openReplaceWin(context, PageRoutes.loginPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 70.h,bottom: 100.h),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/splash/splash_back.png'),
          fit: BoxFit.fill
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/splash/text_icon.png',
            width: 99.88.w,
            height: 33.86.h,
          ),
          SizedBox(height: 32.14.h,),
          Image.asset(
            'images/splash/splash_img.png',
            width: 345.4.w,
            height: 422.42.h,
          ),
          SizedBox(height: 32.58.h,),
          Text(
            'SHARE - INSPIRE - CONNECT',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 43.h,),
          GestureDetector(
            onTap: () async {
              SpUtil? spUtil = await SpUtil.instance;
              spUtil!.putBool('splashType', true);
              NavigatorUtil.openReplaceWin(context, PageRoutes.loginPage);
            },
            child: Container(
              width: 162.w,
              height: 52.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: const Color.fromRGBO(208, 208, 208, 0.3)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GET STARTED',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
