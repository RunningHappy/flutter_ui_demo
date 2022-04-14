import 'package:app_assembly/app_assembly.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/common_widget/common_img_btn.dart';
import 'package:new_project/common_widget/common_right_actions_appbar.dart';
import 'package:new_project/utils/navigator_util.dart';

class SettingDemoPage extends StatefulWidget {
  const SettingDemoPage({Key? key}) : super(key: key);

  @override
  _SettingDemoPageState createState() => _SettingDemoPageState();
}

class _SettingDemoPageState extends State<SettingDemoPage> {

  GlobalKey _key = GlobalKey();
  GlobalKey _key1 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonRightActionsAppBar((){
        NavigatorUtil.closeWin(context);
      }, [
        CommonImgBtn(imgStr: 'images/home/home_item_like.png',width: 24.h,),
        SizedBox(width: 20.w,),
        CommonImgBtn(imgStr: 'images/home/home_item_add.png',width: 24.h,),
        SizedBox(width: 20.w,),
        CommonImgBtn(imgStr: 'images/home/home_detail_share.png',width: 24.h,),
        SizedBox(width: 16.w,),
      ]),
      body: Stack(
        key: _key,
        children: [
          Container(
            width: double.infinity,
            child: ListView(
              children: [
                const CommonWaterButton(Colors.blueAccent, innerIcon: Icon(Icons.call,color: Colors.white,), outSize: 65,),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HollowText1(child: Text('Hello',style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white
                    ),), strokeWidth: 2.w, strokeColor: Colors.blueAccent)
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HollowText2(text: 'Word', size: 20.sp, hollowColor: Colors.white, strokeColor: Colors.redAccent, strokeWidth: 2.w)
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleProgressIndicatorWidget(
                      width: 100,
                      height: 100,
                      value: 1,
                      gradient: const SweepGradient(colors: [Colors.blueAccent, Colors.yellowAccent, Colors.blueAccent], stops: [0.2, 0.3, 1]),
                      strokeWidth: 10,
                      totalDuration: const Duration(
                        seconds: 10,
                      ),
                      child: (context, c) => Center(
                        child: Text(
                          "${((1 - c.value) * 100).toInt()}%",
                          style: TextStyle(

                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.h,),
                _brokenLineExample(context),
                SizedBox(height: 20.h,),
                CommonButton(buttonName: 'test', h: 45, isDisable: true, onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      List<SelectCityModel> hotCityList = [];
                      hotCityList.addAll([
                        SelectCityModel(name: "北京市"),
                        SelectCityModel(name: "广州市"),
                        SelectCityModel(name: "成都市"),
                        SelectCityModel(name: "深圳市"),
                        SelectCityModel(name: "杭州市"),
                        SelectCityModel(name: "武汉市"),
                      ]);
                      return SingleSelectCityPage(
                        appBarTitle: '城市单选',
                        hotCityTitle: '这里是推荐城市',
                        hotCityList: hotCityList,
                        onValueChanged: (SelectCityModel model){

                        },
                      );
                    },
                  ));
                }),
                SizedBox(height: 20.h,),
                CommonButton(
                  key: _key1,
                  buttonName: 'test1',
                  h: 45,
                  fontSize: 24.sp,
                  isDisable: false,
                  onPressed: (){
                    PopupWindow.showPopWindow(context, 'test1', _key1, hasCloseIcon: true, arrowOffset: 30.w);
                  },
                ),
                SizedBox(height: 20.h,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: BubbleText(
                    maxLines: 2,
                    text: '推荐理由：“满五唯一”“临近地铁”“首付低”，多出折行显示，文字展开的样式文式文文字展开的样式文式文。问我哈哈哈哈',
                    onExpanded: (isExpanded) {

                    },
                  ),
                ),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
          CommonDraggleButton(child: const CommonWaterButton(Colors.blueAccent, innerIcon: Icon(Icons.call,color: Colors.white,)), initialOffset: Offset(10.w,50.h), onPressed: (){}, globalKey: _key)
        ],
      ),
    );
  }

  Widget _brokenLineExample(context) {
    var chartLine = BrokenLine(
      showPointDashLine: false,
      yHintLineOffset: 40,
      lines: _getPointsLinesForExample(),
      size: Size(MediaQuery.of(context).size.width - 70.w,190.h),
      isShowXHintLine: true,
      yDialValues: getYDialValuesForExample(),
      xDialValues: _getXDialValuesForExample(_getPointsLinesForExample()),
      yDialMin: 0,
      yDialMax: 120,
      xDialMin: 1,
      xDialMax: 11,
      isHintLineSolid: false,
      isShowYDialText: true,
    );
    return chartLine;
  }

  List<PointsLine> _getPointsLinesForExample() {
    PointsLine pointsLine, _pointsLine2;
    List<PointsLine> pointsLineList = [];
    pointsLine = PointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: true,
      isCurve: false,
      points: [
        PointData(
            pointText: '30',
            y: 30,
            x: 1,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            color: Colors.orange,
                          ),
                          Container(
                            height: 30,
                            color: Colors.greenAccent,
                          ),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.green),
                          Container(height: 20, color: Colors.blue)
                        ],
                      ),
                    ),
                  );
                })),
        PointData(
            pointText: '88',
            y: 80,
            x: 2,
            lineTouchData: LineTouchData(
                onTouch: () {
                  return Container(
                    padding:
                    EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
                    child: Center(
                        child: Text(
                          'content',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(2.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 2.0), //阴影xy轴偏移量
                          blurRadius: 4.0, //阴影模糊程度
                        )
                      ],
                    ),
                  );
                },
                tipWindowSize: Size(60, 40))),
        PointData(
            pointText: '20',
            y: 20,
            x: 3,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '20';
                })),
        PointData(
            pointText: '67',
            y: 67,
            x: 4,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        PointData(
            pointText: '10',
            y: 10,
            x: 5,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '10';
                })),
        PointData(
            pointText: '40',
            y: 40,
            x: 6,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '40';
                })),
        PointData(
            pointText: '100',
            y: 60,
            x: 7,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        PointData(
            pointText: '100',
            y: 70,
            x: 8,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        PointData(
            pointText: '100',
            y: 90,
            x: 9,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
        PointData(
            pointText: '100',
            y: 80,
            x: 10,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '11';
                })),
        PointData(
            pointText: '100',
            y: 100,
            x: 11,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '100';
                })),
      ],
      lineColor: Colors.blue,
      shaderColors: [
        Colors.blue.withOpacity(0.3),
        Colors.blue.withOpacity(0.01)
      ],
    );

    _pointsLine2 = PointsLine(
      isShowXDial: true,
      lineWidth: 3,
      pointRadius: 4,
      isShowPoint: false,
      isCurve: true,
      points: [
        PointData(
            pointText: '15',
            y: 15,
            x: 1,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '15';
                })),
        PointData(
            pointText: '30',
            y: 30,
            x: 2,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '30';
                })),
        PointData(
            pointText: '17',
            y: 17,
            x: 3,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '17';
                })),
        PointData(
            pointText: '18',
            y: 25,
            x: 4,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '18';
                })),
        PointData(
            pointText: '13',
            y: 40,
            x: 5,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '13';
                })),
        PointData(
            pointText: '16',
            y: 30,
            x: 6,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '16';
                })),
        PointData(
            pointText: '49',
            y: 49,
            x: 7,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '49';
                })),
        PointData(
            pointText: '66',
            y: 66,
            x: 8,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '66';
                })),
        PointData(
            pointText: '77',
            y: 80,
            x: 9,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '77';
                })),
        PointData(
            pointText: '88',
            y: 90,
            x: 10,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '88';
                })),
        PointData(
            pointText: '99',
            y: 60,
            x: 11,
            lineTouchData: LineTouchData(
                tipWindowSize: Size(60, 40),
                onTouch: () {
                  return '99';
                })),
      ],
      shaderColors: [
        Colors.green.withOpacity(0.3),
        Colors.green.withOpacity(0.01)
      ],
      lineColor: Colors.green,
    );

    pointsLineList.add(pointsLine);
    pointsLineList.add(_pointsLine2);
    return pointsLineList;
  }

  List<DialItem> getYDialValuesForExample() {
    return [
      DialItem(
        dialText: '0',
        dialTextStyle: TextStyle(fontSize: 10.0, color: Colors.green),
        value: 0,
      ),
      DialItem(
        dialText: '20',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 20,
      ),
      DialItem(
        dialText: '40',
        dialTextStyle: TextStyle(fontSize: 10.0, color: Colors.red),
        value: 40,
      ),
      DialItem(
        dialText: '60',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 60,
      ),
      DialItem(
        dialText: '80',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 80,
      ),
      DialItem(
        dialText: '100',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 100,
      ),
      DialItem(
        dialText: '120',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: 120,
      )
    ];
  }

  _getXDialValuesForExample(List<PointsLine> lines) {
    List<DialItem> _xDialValue = [];
    for (int index = 0; index < lines[0].points.length; index++) {
      _xDialValue.add(DialItem(
        dialText: '${lines[0].points[index].x}',
        dialTextStyle: TextStyle(fontSize: 12.0, color: Color(0xFF999999)),
        value: lines[0].points[index].x,
      ));
    }
    return _xDialValue;
  }

}
