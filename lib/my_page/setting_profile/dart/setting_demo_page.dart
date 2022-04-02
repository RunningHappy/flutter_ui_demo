import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:new_project/common_widget/common_right_actions_appbar.dart';
import 'package:new_project/utils/navigator_util.dart';

class SettingDemoPage extends StatefulWidget {
  const SettingDemoPage({Key? key}) : super(key: key);

  @override
  _SettingDemoPageState createState() => _SettingDemoPageState();
}

class _SettingDemoPageState extends State<SettingDemoPage> {

  GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonRightActionsAppBar((){
        NavigatorUtil.closeWin(context);
      }, [
        CommonImgBtn(imgStr: 'images/home/home_item_like.png',width: 24.h,),
        SizedBox(width: 20.w,),
        CommonImgBtn(imgStr: 'images/home/home_item_add.png',width: 24.h,),
        SizedBox(width: 20.w,),
        CommonImgBtn(imgStr: 'images/home/home_detail_share.png',width: 24.h,),
        SizedBox(width: 16.w,),
      ]),
      body: Stack(
        key: _key,
        children: [
          Container(
            width: double.infinity,
            child: Column(
              children: [
                const CommonWaterButton(Colors.blueAccent, innerIcon: Icon(Icons.call,color: Colors.white,), outSize: 65,),
                SizedBox(height: 20.h,),
                HollowText1(child: Text('Hello',style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white
                ),), strokeWidth: 2.w, strokeColor: Colors.blueAccent),
                SizedBox(height: 20.h,),
                HollowText2(text: 'Word', size: 20.sp, hollowColor: Colors.white, strokeColor: Colors.redAccent, strokeWidth: 2.w),
                SizedBox(height: 20.h,),
                CircleProgressIndicatorWidget(
                  width: 100,
                  height: 100,
                  value: 1,
                  gradient: const SweepGradient(colors: [Colors.blueAccent, Colors.yellowAccent, Colors.blueAccent], stops: [0.2, 0.3, 1]),
                  strokeWidth: 10,
                  totalDuration: const Duration(
                    seconds: 10,
                  ),
                  child: (context, c) => Center(
                    child: Text(
                      "${((1 - c.value) * 100).toInt()}%",
                      style: TextStyle(

                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonDraggleButton(child: const CommonWaterButton(Colors.blueAccent, innerIcon: Icon(Icons.call,color: Colors.white,)), initialOffset: Offset(10.w,50.h), onPressed: (){}, globalKey: _key)
        ],
      ),
    );
  }
}
