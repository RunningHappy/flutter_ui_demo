import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/common_widget/common_text_btn.dart';
import 'package:new_project/discover_page/discover_detail/components/detail_form_msg_line.dart';

class DetailFormView extends StatelessWidget {
  const DetailFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 22.h,bottom: 24.h),
      margin: EdgeInsets.symmetric(horizontal: 25.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFF2F2F2),
            width: 1.h
          )
        )
      ),
      child: Column(
        children: [
          const DetailFormMsgLine(title: 'Deadline', msg: '30 days left'),
          SizedBox(height: 20.h,),
          const DetailFormMsgLine(title: 'Prize', msg: "\$ 100.00"),
          SizedBox(height: 24.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "READY TO WIN THIS ",
                style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black
                ),
              ),
              CommonTextBtn(title: 'CHALLENGE',fontSize: 14.sp,callBack: (){

              },)
            ],
          ),
          SizedBox(height: 24.h,),
          CommonLinearBtn(title: 'SUBMIT YOUR SHOT',callBack: () async {

          },),
          SizedBox(height: 24.h,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CommonTextBtn(title: '350',fontSize: 14.sp,callBack: (){

              },),
              Text(
                " people have joined this challenge",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
