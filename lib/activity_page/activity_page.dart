import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/activity_page/components/activity_item.dart';
import 'package:new_project/activity_page/components/activity_setting_dialog.dart';
import 'package:new_project/common_widget/common_title_appbar.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {

  List<ActivityItemModel> dataList = [
    ActivityItemModel('images/activity/avatar_1.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, false, true),
    ActivityItemModel('images/activity/avatar_2.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', false, false, true),
    ActivityItemModel('images/activity/avatar_3.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, true, false),
    ActivityItemModel('images/activity/avatar_4.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, true, false),
    ActivityItemModel('images/activity/avatar_5.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', false, true, true),
    ActivityItemModel('images/activity/avatar_6.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, true, false),
    ActivityItemModel('images/activity/avatar_1.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, false, true),
    ActivityItemModel('images/activity/avatar_2.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', false, false, true),
    ActivityItemModel('images/activity/avatar_3.png', 'Bruno Pham', '2 minutes ago', '“Autumn in my heart”', true, true, false),
  ];
  
  List<ActivityDialogModel> dialogData = [
    ActivityDialogModel('Collections', true),
    ActivityDialogModel('Comment Likes', false),
    ActivityDialogModel('Followers', false),
    ActivityDialogModel('Likes', true),
    ActivityDialogModel('Donate', true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonTitleAppBar('images/activity/activity_setting_icon.png', 'Activity', '(03)',subTitleColor: Color(0xFF888BF4),clickRightAction: (){
        ActivitySettingDialog.showMyConfirmDialog(context,dialogData);
      }),
      body: ListView.builder(
        itemCount: dataList.length,
        padding: EdgeInsets.fromLTRB(14.w, 16.h, 14.w, 65.h),
        itemBuilder: (context,index){
          return ActivityItem(itemModel: dataList[index]);
        }
      ),
    );
  }
}
