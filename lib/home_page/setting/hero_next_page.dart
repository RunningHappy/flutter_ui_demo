import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_trans_appbar.dart';
import 'package:new_project/utils/navigator_util.dart';

class HeroNextPage extends StatefulWidget {
  const HeroNextPage({Key? key}) : super(key: key);

  @override
  _HeroNextPageState createState() => _HeroNextPageState();
}

class _HeroNextPageState extends State<HeroNextPage> {

  var opactity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CommonTansAppBar(opactity, (){
        NavigatorUtil.closeWin(context);
      },title: '@brunopham',fontSize: 14.sp,showBack: true,actions: []),
      body: Column(
        children: [
          Hero(
            tag: 'heroTag',
            child: Image.asset(
              'images/askpage/ask_content_1.png',
              width: double.infinity,
            )
          )
        ],
      ),
    );
  }
}
