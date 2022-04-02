import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/common_widget/common_textfiled.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/comonents/save_collection_dialog_grid_item.dart';
import 'package:new_project/utils/navigator_util.dart';

class EditCollectionDialog extends Dialog {
  const EditCollectionDialog({Key? key,}) : super(key: key);

  ///取消对话框
  static disMissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // 显示对话框
  static showMyConfirmDialog(BuildContext context,) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) {
        return const EditCollectionDialogContent();
      }
    );
  }
}

class EditCollectionDialogContent extends StatefulWidget {
  const EditCollectionDialogContent({Key? key}) : super(key: key);

  @override
  _EditCollectionDialogContentState createState() => _EditCollectionDialogContentState();
}

class _EditCollectionDialogContentState extends State<EditCollectionDialogContent> {

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: Color(0x80333333),
          body: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 232.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.h),
                              topRight: Radius.circular(10.h)
                            ),
                            color: const Color(0xFFBDBDBD)
                          ),
                          height: 10.h,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.h),
                                topRight: Radius.circular(20.h)
                              ),
                              color: Colors.white
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(30.w, 58.h, 30.w, 30.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonTextField(controller: textController, plaseText: 'Type name',),
                                CommonLinearBtn(title: 'CREATE COLLECTION',fontSize: 16.sp,)
                              ],
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      NavigatorUtil.closeWin(context);
                    },
                    child: Image.asset(
                      'images/activity/activity_dialog_close_icon.png',
                      width: 36.h,
                      height: 36.h,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      )
    );
  }
}
