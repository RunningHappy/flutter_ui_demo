import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/router/page_routers.dart';
import 'package:new_project/utils/navigator_util.dart';

class SearchViewItem extends StatelessWidget {
  final String imgPath;
  final String title;
  final Alignment? textAlign;
  const SearchViewItem({Key? key,required this.imgPath,required this.title,this.textAlign = Alignment.centerLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        NavigatorUtil.openWin(context, PageRoutes.discoverDetailPage);
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16.h),
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Image.asset(
                imgPath,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Image.asset(
                'images/discover/search_view_mask.png'
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              alignment: textAlign,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
