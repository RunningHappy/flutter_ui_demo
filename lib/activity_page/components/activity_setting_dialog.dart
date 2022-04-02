import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_title_switch_view.dart';
import 'package:new_project/utils/navigator_util.dart';

class ActivitySettingDialog extends Dialog {
  const ActivitySettingDialog({Key? key,}) : super(key: key);

  ///取消对话框
  static disMissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // 显示对话框
  static showMyConfirmDialog(BuildContext context,List<ActivityDialogModel> dataList) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) {
        return ActivitySettingDialogContent(dataList: dataList,);
      }
    );
  }
}

class ActivitySettingDialogContent extends StatefulWidget {
  final List<ActivityDialogModel> dataList;
  const ActivitySettingDialogContent({Key? key,required this.dataList}) : super(key: key);

  @override
  _ActivitySettingDialogContentState createState() => _ActivitySettingDialogContentState();
}

class _ActivitySettingDialogContentState extends State<ActivitySettingDialogContent> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: const Color(0x80333333),
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 480.h,
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
                          padding: EdgeInsets.fromLTRB(20.w, 41.h, 20.w, 72.h),
                          child: Column(
                            children: [
                              Text(
                                'Activity Feed',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: const Color(0xFF212121),
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              SizedBox(height: 24.h,),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  itemCount: widget.dataList.length,
                                  itemBuilder: (context,index){
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 10.h),
                                      child: CommonTitleSwitchView(
                                        title: widget.dataList[index].title,
                                        activity: widget.dataList[index].activity,
                                        switchChange: (bool activity){
                                          setState(() {
                                            widget.dataList[index].activity = activity;
                                          });
                                        },
                                      ),
                                    );
                                  }
                                )
                              )
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
    );
  }
}

class ActivityDialogModel{
  String title;
  bool activity;
  ActivityDialogModel(this.title,this.activity);
}
