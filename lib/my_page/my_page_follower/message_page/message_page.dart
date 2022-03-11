import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_title_right_action_appbar.dart';
import 'package:new_project/my_page/my_page_follower/message_page/components/message_list_item.dart';
import 'package:new_project/utils/navigator_util.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  List<MessageListModel> dataList = [
    MessageListModel(false),
    MessageListModel(true),
    MessageListModel(false),
    MessageListModel(true),
    MessageListModel(false),
    MessageListModel(false),
    MessageListModel(false),
    MessageListModel(false),
    MessageListModel(false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonTitleRightActionAppBar((){
        NavigatorUtil.closeWin(context);
      }, 'images/home/detail_msg_share.png', 'Message', (){

      }),
      body: ListView.builder(
        itemCount: dataList.length,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        itemBuilder: (context,index){
          return MessageListItem(itemModel: dataList[index],);
        }
      ),
    );
  }
}
