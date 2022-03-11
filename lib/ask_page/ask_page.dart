import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/ask_page/components/ask_page_top.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/login_page/components/title_content.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';
import 'package:new_project/utils/share_preferences_util.dart';

class AskPage extends StatefulWidget {
  const AskPage({Key? key}) : super(key: key);

  @override
  _AskPageState createState() => _AskPageState();
}

class _AskPageState extends State<AskPage> {

  var imageList = [
    'images/askpage/ask_content_1.png',
    'images/askpage/ask_content_2.png',
    'images/askpage/ask_content_3.png',
    'images/askpage/ask_content_4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const AskTopView(),
            Expanded(
              child: Column(
                children: [
                  TitleContent(data: 'Who are you?',fontSize: 20.sp,fontColor: Colors.black,),
                  SizedBox(height: 40.h,),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      itemCount: imageList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        //横轴元素个数
                        crossAxisCount: 2,
                        //纵轴间距
                        mainAxisSpacing: 20.h,
                        //横轴间距
                        crossAxisSpacing: 20.w,
                        //子组件宽高长度比例
                        childAspectRatio: 153/180
                      ),
                      itemBuilder: (context,index){
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(imageList[index]),
                                fit: BoxFit.fill
                              )
                            ),
                          ),
                        );
                      }
                    )
                  ),
                  SizedBox(height: 40.h,),
                  TitleContent(data: 'SHARE - INSPIRE - CONNECT',fontSize: 14.sp,fontColor: Color(0xFF888BF4),),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 27.h),
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: CommonLinearBtn(title: 'EXPLORE NOW',callBack: () async {
                SpUtil? spUtil = await SpUtil.instance;
                spUtil!.putBool('askPageType', true);
                NavigatorUtil.openWinCloseToALl(context, PageRoutes.bottomBar);
              },),
            )
          ],
        ),
      ),
    );
  }
}
