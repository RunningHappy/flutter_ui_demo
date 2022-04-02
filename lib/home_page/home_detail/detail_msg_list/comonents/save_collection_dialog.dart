import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/comonents/edit_collection_dialog.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/comonents/save_collection_dialog_grid_item.dart';
import 'package:new_project/utils/navigator_util.dart';

class SaveCollectionDialog extends Dialog {
  const SaveCollectionDialog({Key? key,}) : super(key: key);

  ///取消对话框
  static disMissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  // 显示对话框
  static showMyConfirmDialog(BuildContext context,List<SaveCollectionDialogModel> dataList) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (BuildContext context) {
        return SaveCollectionDialogContent(dataList: dataList,);
      }
    );
  }
}

class SaveCollectionDialogContent extends StatefulWidget {
  final List<SaveCollectionDialogModel> dataList;
  const SaveCollectionDialogContent({Key? key,required this.dataList}) : super(key: key);

  @override
  _SaveCollectionDialogContentState createState() => _SaveCollectionDialogContentState();
}

class _SaveCollectionDialogContentState extends State<SaveCollectionDialogContent> {

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
              height: 537.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 9.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
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
                            padding: EdgeInsets.fromLTRB(0.w, 34.h, 0.w, 47.h),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 6.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Save to collection',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700
                                        ),
                                      ),
                                      CommonLinearBtn(title: 'New Collection',fontSize: 14.sp,height: 36.h,width: 129.w,callBack: (){
                                        NavigatorUtil.closeWin(context);
                                        EditCollectionDialog.showMyConfirmDialog(context);
                                      },)
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Collections',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400
                                          ),
                                        ),
                                        SizedBox(height: 16.h,),
                                        Expanded(
                                          child: GridView.builder(
                                            itemCount: widget.dataList.length,
                                            padding: EdgeInsets.all(0),
                                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                              //横轴元素个数
                                              crossAxisCount: 2,
                                              //纵轴间距
                                              mainAxisSpacing: 19.h,
                                              //横轴间距
                                              crossAxisSpacing: 19.h,
                                              //子组件宽高长度比例
                                              childAspectRatio: 1
                                            ),
                                            itemBuilder: (context,index){
                                              return SaveCollectionDialogGridItem(itemData: widget.dataList[index],);
                                            }
                                          )
                                        )
                                      ],
                                    ),
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

class SaveCollectionDialogModel{
  bool activity;
  SaveCollectionDialogModel(this.activity);
}
