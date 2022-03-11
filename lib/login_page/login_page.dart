import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/card_msg_container.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:new_project/common_widget/common_linear_btn.dart';
import 'package:new_project/common_widget/common_text_btn.dart';
import 'package:new_project/common_widget/common_textfiled.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/login_page/components/title_content.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';
import 'package:new_project/utils/share_preferences_util.dart';

enum RegisterType{
  code,
  email,
  password
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  var isLogin = true;

  var isRegister = false;

  var registerType;

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage( isRegister ? 'images/login/register_back.png' : 'images/login/login_back.png'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter
            )
          ),
          child: Container(
            height: isRegister ? 590.h : 540.h,
            width: double.infinity,
            padding: isRegister ? EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 0) : EdgeInsets.fromLTRB(30.w, 40.h, 30.w, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28.w),
                topRight: Radius.circular(28.w),
              ),
              color: Colors.white
            ),
            child: isRegister ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleContent(data: registerType == RegisterType.code ? 'VERIFICATION' : registerType == RegisterType.email ? 'TYPE YOUR EMAIL' : 'SET NEW PASSWORD',),
                SizedBox(height: 14.h,),
                CardMsgContainer(title: registerType == RegisterType.code ? 'A message with verification code was sent to your mobile phone.' : registerType == RegisterType.email ? 'We will send you instruction on how to reset your password' : 'Type your new password',),
                SizedBox(height: 40.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      registerType == RegisterType.code ? Column(
                        children: [
                          CommonTextField(controller: phone, plaseText: 'Type verification code',textAlign: TextAlign.center,),
                          SizedBox(height: 40.h,),
                          CommonTextBtn(title: "DON'T RECEIVE THE CODE",fontColor: Colors.black,fontSize: 14.sp,callBack: (){

                          },),
                          SizedBox(height: 40.h,),
                        ],
                      ) : registerType == RegisterType.email ? Column(
                        children: [
                          CommonTextField(controller: phone, plaseText: 'Email',),
                          SizedBox(height: 97.h,),
                        ],
                      ) : Column(
                        children: [
                          CommonTextField(controller: phone, plaseText: 'Password',commonType: CommonTextFieldType.password,),
                          SizedBox(height: 20.h,),
                          CommonTextField(controller: phone, plaseText: 'Confirm Password',commonType: CommonTextFieldType.password,),
                          SizedBox(height: 40.h,),
                        ],
                      ),
                      CommonLinearBtn(title: registerType == RegisterType.code ? 'VERIFY' : 'SEND',callBack: (){
                        if(registerType == RegisterType.email){
                          setState(() {
                            registerType = RegisterType.password;
                          });
                        }
                      },),
                    ],
                  ),
                ),
                SizedBox(height: 65.59.h,),
                Image.asset(
                  'images/login/register_icon.png',
                  width: 224.86.w,
                  height: 90.95.h,
                )
              ],
            ) : isLogin ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextField(controller: phone, plaseText: 'Email',),
                SizedBox(height: 20.h,),
                CommonTextField(controller: password, plaseText: 'Password', commonType: CommonTextFieldType.password,),
                SizedBox(height: 40.h,),
                CommonTextBtn(title: 'FORGOT PASSWORD',callBack: (){
                  setState(() {
                    isRegister = true;
                    registerType = RegisterType.email;
                  });
                },),
                SizedBox(height: 40.h,),
                CommonLinearBtn(title: 'LOG IN',callBack: () async {
                  SpUtil? spUtil = await SpUtil.instance;
                  var temp = spUtil!.getBool('askPageType') == null ? false : spUtil.getBool('askPageType') == false ? false : true;
                  if(!temp){
                    NavigatorUtil.openReplaceWin(context, PageRoutes.askPage);
                  }else{
                    NavigatorUtil.openWinCloseToALl(context, PageRoutes.bottomBar);
                  }
                },),
                SizedBox(height: 40.h,),
                Text(
                  'OR LOG IN BY',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 14.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonImgBtn(imgStr: 'images/login/google_icon.png'),
                    SizedBox(width: 20.w,),
                    CommonImgBtn(imgStr: 'images/login/facebook_icon.png'),
                  ],
                ),
                SizedBox(height: 40.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have account? ",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black
                      ),
                    ),
                    CommonTextBtn(title: 'SIGN UP',callBack: (){
                      setState(() {
                        isLogin = false;
                      });
                    },)
                  ],
                )
              ],
            ) : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextField(controller: phone, plaseText: 'Email',),
                SizedBox(height: 20.h,),
                CommonTextField(controller: phone, plaseText: 'Email',),
                SizedBox(height: 20.h,),
                CommonTextField(controller: password, plaseText: 'Password', commonType: CommonTextFieldType.password,),
                SizedBox(height: 40.h,),
                CommonLinearBtn(title: 'SIGN IN',callBack: (){
                  setState(() {
                    isRegister = true;
                    registerType = RegisterType.code;
                  });
                },),
                SizedBox(height: 40.h,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have account? ",
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black
                      ),
                    ),
                    CommonTextBtn(title: 'LOG IN',callBack: (){
                      setState(() {
                        isLogin = true;
                      });
                    },)
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
