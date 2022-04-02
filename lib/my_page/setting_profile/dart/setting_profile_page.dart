import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/common_widget/common_textfiled.dart';
import 'package:new_project/common_widget/common_trans_appbar.dart';
import 'package:new_project/my_page/setting_profile/dart/components/setting_header_view.dart';
import 'package:new_project/utils/navigator_util.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({Key? key}) : super(key: key);

  @override
  _SettingProfilePageState createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CommonTansAppBar(0, (){
        NavigatorUtil.closeWin(context);
      },title: 'Edit Profile',fontSize: 20.sp,showBack: true,backIconColor: Colors.transparent),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SettingHeaderView(),
          SizedBox(height: 55.h,),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  CommonTextField(controller: email, plaseText: 'Email',),
                  SizedBox(height: 30.h,),
                  Text(
                    'Last name',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  CommonTextField(controller: email, plaseText: 'Name',),
                  SizedBox(height: 30.h,),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  SizedBox(height: 6.h,),
                  CommonTextField(controller: email, plaseText: 'brunopham@gmail.com',),
                ],
              ),
            )
          ),
          SizedBox(height: 170.h,),
          Container(
            padding: EdgeInsets.only(bottom: Platform.isIOS ? MediaQuery.of(context).padding.bottom : 0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w,vertical: 10.h),
              child: CommonLinearBtn(title: 'SAVE CHANGES'),
            ),
          )
        ],
      ),
    );
  }
}
