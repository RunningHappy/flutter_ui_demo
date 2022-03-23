import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_search_bar.dart';
import 'package:new_project/common_widget/common_segment.dart';
import 'package:new_project/common_widget/form_hide_keyboard.dart';
import 'package:new_project/home_page/components/home_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController search = TextEditingController();

  List<TitleModel> titleList = [
    TitleModel('Popular', true),
    TitleModel('Trending', false),
    TitleModel('Following', false),
  ];

  List<HomeListModel> dataList = [
    HomeListModel('images/home/item_1.png', 'Thanh Pham', '1 hour ago', '20', '125', 'images/home/home_item_header_1.png'),
    HomeListModel('images/home/item_2.png', 'Bruno', '1 hour ago', '10', '98', 'images/home/home_item_header_2.png'),
  ];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormHideKeyboardWidget(
      childWidget: Scaffold(
        appBar: CommonSearchBar(search,'Search'),
        body: Column(
          children: [
            CommonSegment(
              titleList: titleList,
              normalColor: Color(0xFFBDBDBD),
              selectColor: Color(0xFF888BF4),
              normalBackColor: Colors.transparent,
              selectBackColor: Color(0xFFF1F1FE),
              callBack: (index){
                for(var item in titleList){
                  item.select = false;
                }
                setState(() {
                  titleList[index].select = true;
                });
              },
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 65.h),
                  itemCount: dataList.length,
                  itemBuilder: (context,index){
                    return HomeItem(itemModel: dataList[index],);
                  }
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}
