import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_search_bar.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/discover_page/search_page/components/searc_view_item.dart';

class DiscoverSearchPage extends StatefulWidget {
  const DiscoverSearchPage({Key? key}) : super(key: key);

  @override
  _DiscoverSearchPageState createState() => _DiscoverSearchPageState();
}

class _DiscoverSearchPageState extends State<DiscoverSearchPage> {

  TextEditingController search = TextEditingController();

  FocusNode _focusNode = FocusNode();

  bool showCancle = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus){
        setState(() {
          showCancle = true;
        });
      }else{
        setState(() {
          showCancle = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: Scaffold(
        backgroundColor: Colors.white,
        appBar: CommonSearchBar(search,'Type something',showRightBtn: false,focusNode: _focusNode,showCancle: showCancle,clickCancle: (){
          _focusNode.unfocus();
        }),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.h,vertical: 20.h),
          children: const [
            SearchViewItem(imgPath: 'images/discover/search_view_1_img.png', title: 'PHOTOGRAPHY',textAlign: Alignment.centerLeft,),
            SearchViewItem(imgPath: 'images/discover/search_view_2_img.png', title: 'IILUSTRATION',textAlign: Alignment.centerRight,),
            SearchViewItem(imgPath: 'images/discover/search_view_3_img.png', title: 'DESIGN',textAlign: Alignment.centerLeft,),
            SearchViewItem(imgPath: 'images/discover/search_view_4_img.png', title: 'MAKING VIDEO',textAlign: Alignment.centerRight,),
          ],
        ),
      )
    );
  }
}
