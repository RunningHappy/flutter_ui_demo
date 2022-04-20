import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:new_project/common_widget/common_right_actions_appbar.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class SettingChildPage extends StatefulWidget {
  const SettingChildPage({Key? key}) : super(key: key);

  @override
  _SettingChildPageState createState() => _SettingChildPageState();
}

class _SettingChildPageState extends State<SettingChildPage> {

  var currentIndex = 0;

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: Scaffold(
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
        body: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                children: const {
                  0:Text('全部'),
                  1:Text('收入'),
                  2:Text('支出'),
                  3:Text('支出1'),
                  4:Text('支出2'),
                  5:Text('支出3'),
                  6:Text('支出4'),
                },
                groupValue: currentIndex,
                backgroundColor: Colors.grey,
                thumbColor: Colors.white,
                onValueChanged: (int? index){
                  setState(() {
                    currentIndex = index!;
                  });
                }
              ),
            ),
            SizedBox(height: 20.h,),
            SizedBox(
              width: double.infinity,
              child: CupertinoSegmentedControl(
                padding: const EdgeInsets.all(0),
                children: const {
                  0:Text('全部'),
                  1:Text('收入'),
                  2:Text('支出'),
                  3:Text('支出1'),
                  4:Text('支出2'),
                  5:Text('支出3'),
                  6:Text('支出4'),
                },
                groupValue: currentIndex,
                unselectedColor: Colors.grey,
                selectedColor: Colors.white,
                borderColor: Colors.grey,
                // pressedColor: Colors.yellowAccent,
                onValueChanged: (int? index){
                  setState(() {
                    currentIndex = index!;
                  });
                }
              ),
            ),
            SizedBox(height: 20.h,),
            CupertinoSearchTextField(
              controller: search,
              placeholder: 'search',
              style: TextStyle(
                fontSize: 18.sp
              ),
              placeholderStyle: TextStyle(
                fontSize: 18.sp,
              ),
              prefixInsets: EdgeInsets.only(left: 6.w),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20.h,),
            CupertinoContextMenu(
              actions: <Widget>[
                CupertinoContextMenuAction(
                  child: const Text('Action one'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                CupertinoContextMenuAction(
                  child: const Text('Action two'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              child: Image.asset(
                'images/askpage/ask_content_1.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const RotatedBox(
                  quarterTurns: 1, // 90°的整数倍
                  child: Text('HELLO WORD !'),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PopupMenuButton(
                  itemBuilder: (BuildContext context){
                    return [
                      const PopupMenuItem(child: Text("DOTA"),value: "dota",),
                      const PopupMenuItem(child: Text("英雄联盟"),value: ["盖伦", "皇子", "提莫"],),
                      const PopupMenuItem(child: Text("王者荣耀"),value: {"name":"王者荣耀"},),
                    ];
                  },
                  child: Text(
                    '弹出菜单',
                    style: TextStyle(
                        fontSize: 16.sp
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    NavigatorUtil.openWin(context, PageRoutes.heroNextPage);
                  },
                  child: Hero(
                    tag: 'heroTag',
                    child: IndexedStack(
                      index: currentIndex,
                      children: [
                        Image.asset(
                          'images/askpage/ask_content_1.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_2.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_3.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_4.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_1.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_2.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_3.png',
                          width: 100.w,
                        ),
                      ],
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    NavigatorUtil.openWin(context, PageRoutes.heroNextPage);
                  },
                  child: Hero(
                    tag: 'heroTag1',
                    child: IndexedStack(
                      index: currentIndex,
                      children: [
                        Image.asset(
                          'images/askpage/ask_content_4.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_3.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_2.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_1.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_3.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_2.png',
                          width: 100.w,
                        ),
                        Image.asset(
                          'images/askpage/ask_content_1.png',
                          width: 100.w,
                        ),
                      ],
                    )
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
