import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPageGridModel{
  String title;
  String msg;
  MyPageGridModel(this.title,this.msg);
}

class MyPageGridItem extends StatelessWidget {
  final MyPageGridModel itemModel;
  final Function()? callBack;
  const MyPageGridItem({Key? key,required this.itemModel,this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(callBack != null){
          callBack!();
        }
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: 158.w,
                  height: 158.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.h),
                    child: Column(
                      children: [
                        Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                      'images/discover/detail_man_1.png',
                                    )
                                ),
                                Expanded(
                                    child: Image.asset(
                                      'images/discover/detail_woman.png',
                                      fit: BoxFit.cover,
                                    )
                                )
                              ],
                            )
                        ),
                        Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                    child: Image.asset(
                                      'images/discover/detail_man_1.png',
                                    )
                                ),
                                Expanded(
                                    child: Image.asset(
                                      'images/discover/detail_woman.png',
                                      fit: BoxFit.cover,
                                    )
                                )
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 158.w,
                  height: 158.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.h),
                      color: Color(0x50333333)
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    itemModel.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                )
              ],
            ),
            Expanded(
                child: Text(
                  itemModel.msg,
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xFF828282)
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
