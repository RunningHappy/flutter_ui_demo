import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/home_page/home_detail/detail_msg_list/comonents/save_collection_dialog.dart';

class SaveCollectionDialogGridItem extends StatelessWidget {
  final SaveCollectionDialogModel itemData;
  const SaveCollectionDialogGridItem({Key? key,required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Stack(
          children: [
            Image.asset(
              'images/home/save_collection_dialog_img.png',
            ),
            Offstage(
              offstage: itemData.activity ? false : true,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.h),
                  color: const Color(0x60888BF4)
                ),
                alignment: Alignment.topRight,
                child: Image.asset(
                  'images/home/save_collection_dialog_grid_select.png',
                  width: 24.h,
                  height: 24.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
