import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_edit_text_btn.dart';
import 'package:new_project/common_widget/common_title_right_action_appbar.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/home_page/home_detail/components/home_detail_list_item.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/comonents/save_collection_dialog.dart';
import 'package:new_project/utils/navigator_util.dart';

class DetailMsgListPage extends StatefulWidget {
  const DetailMsgListPage({Key? key}) : super(key: key);

  @override
  _DetailMsgListPageState createState() => _DetailMsgListPageState();
}

class _DetailMsgListPageState extends State<DetailMsgListPage> {

  TextEditingController confirm = TextEditingController();

  List<SaveCollectionDialogModel> dataList = [
    SaveCollectionDialogModel(false),
    SaveCollectionDialogModel(true),
    SaveCollectionDialogModel(true),
    SaveCollectionDialogModel(false)
  ];

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonTitleRightActionAppBar((){
          NavigatorUtil.closeWin(context);
        }, 'images/home/detail_msg_share.png', 'Comments', (){
          SaveCollectionDialog.showMyConfirmDialog(context,dataList);
        }),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 14,
                itemBuilder: (context,index){
                  return const HomeDetailListItem(showBtn: false,);
                }
              )
            ),
            CommonEditTextBtn(controller: confirm,btnTitle: 'Post',plaseText: 'Type something',)
          ],
        ),
      )
    );
  }
}
