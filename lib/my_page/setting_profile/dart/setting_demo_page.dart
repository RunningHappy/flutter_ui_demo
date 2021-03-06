import 'dart:math';
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

class _SettingDemoPageState extends State<SettingDemoPage> with SingleTickerProviderStateMixin {

  GlobalKey _key = GlobalKey();
  GlobalKey _key1 = GlobalKey();
  late AnimationController controller;
  late Animation<double> animation;
  late double radius;
  int? sideCount;
  double? angle;
  late double padding;
  Map<String, List<double>> dataList1 = Map();
  Map<String, List<double>> dataList2 = Map();
  List<DoughnutDataItem> dataList = [];
  DoughnutDataItem? selectedItem;
  List<Color> preinstallColors = [
    Color(0xffFF862D),
    Color(0xff26BB7D),
    Color(0xffFFDD00),
    Color(0xff6AA6FB),
    Color(0xff0984F9),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    radius = 80;
    sideCount = 5;
    padding = 4;
    angle = 0;
    for (int i = 3; i <= 6; i++) {
      List<double> data1 = [];
      List<double> data2 = [];

      for (int j = 0; j < i; j++) {
        data1.add(Random().nextDouble() * 10);
        data2.add(Random().nextDouble() * 10);
      }
      dataList1[i.toString()] = data1;
      dataList2[i.toString()] = data2;
    }
    controller = AnimationController( duration: const Duration(milliseconds: 1000), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    animation = Tween(begin: 0.0, end: 1.0).animate(animation);
    controller.forward();
    for (int i = 0; i < 5; i++) {
      dataList.add(DoughnutDataItem(
          title: '示例${i+1}',
          value: random(1, 5).toDouble(),
          color: getColorWithIndex(i)));
    }
  }

  int random(int min, int max) {
    final _random = Random();
    return min + _random.nextInt(max - min + 1);
  }

  Color getColorWithIndex(int index) {
    return this.preinstallColors[index % this.preinstallColors.length];
  }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CommonWaterButton(Colors.blueAccent, innerIcon: Icon(Icons.call,color: Colors.white,), outSize: 65,),
                  ],
                ),
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
                AnimatedBuilder(
                  animation: animation,
                  builder: (_, __) {
                    return RadarChart(
                      radius: radius,
                      provider: RadarProvider(sideCount, dataList1, dataList2),
                      sidesCount: sideCount!,
                      markerMargin: padding,
                      crossedAxisLine: true,
                      rotateAngle: angle! * 2 * pi / 360,
                      animateProgress: animation.value,
                      axisLineColor: Colors.orangeAccent,
                      builder: (index) {
                        return Text(
                          '顶点${index.toString()}',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 12.sp
                          ),
                        );
                      },
                    );
                  }
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DoughnutChart(
                      width: 200.h,
                      height: 200.h,
                      data: dataList,
                      selectedItem: selectedItem,
                      showTitleWhenSelected: true,
                      selectCallback: (DoughnutDataItem? selectedItem) {
                        setState(() {
                          this.selectedItem = selectedItem;
                        });
                      },
                    ),
                    SizedBox(width: 30.w,),
                      DoughnutChartLegend(
                      data: this.dataList,
                      legendStyle: DoughnutChartLegendStyle.list
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                ProgressBarChart(
                  barChartStyle: BarChartStyle.horizontal,
                  xAxis: ChartAxis(axisItemList: [
                    AxisItem(showText: '10'),
                    AxisItem(showText: '20'),
                    AxisItem(showText: '30')
                  ]),
                  yAxis: ChartAxis(axisItemList: [
                    AxisItem(showText: '示例1'),
                    AxisItem(showText: '示例2')
                  ]),
                  singleBarWidth: 30,
                  barBundleList: [
                    ProgressBarBundle(barList: [
                      ProgressBarItem(text: '示例', value: 10, hintValue: 15),
                      ProgressBarItem(text: '示例', value: 20)
                    ], colors: [
                      Color(0xff1545FD),
                      Color(0xff0984F9)
                    ]),
                  ],
                ),
                SizedBox(height: 20.h,),
                ProgressBarChart(
                  barChartStyle: BarChartStyle.vertical,
                  xAxis: ChartAxis(axisItemList: [
                    AxisItem(showText: '示例1'),
                    AxisItem(showText: '示例2'),
                    AxisItem(showText: '示例3'),
                    AxisItem(showText: '示例4'),
                    AxisItem(showText: '示例5'),
                    AxisItem(showText: '示例6'),
                    AxisItem(showText: '示例7'),
                    AxisItem(showText: '示例8'),
                    AxisItem(showText: '示例9'),
                    AxisItem(showText: '示例10'),
                  ]),
                  barBundleList: [
                    ProgressBarBundle(barList: [
                      ProgressBarItem(
                          text: '示例11',
                          value: 5,
                          hintValue: 15,
                          showBarValueText: "1122334"),
                      ProgressBarItem(
                          text: '示例12', value: 20, selectedHintText: '示例12:20'),
                      ProgressBarItem(
                          text: '示例13',
                          value: 30,
                          selectedHintText: '示例13:30'),
                      ProgressBarItem(text: '示例14', value: 25),
                      ProgressBarItem(text: '示例15', value: 21),
                      ProgressBarItem(text: '示例16', value: 28),
                      ProgressBarItem(text: '示例17', value: 15),
                      ProgressBarItem(text: '示例18', value: 11),
                      ProgressBarItem(text: '示例19', value: 30),
                      ProgressBarItem(text: '示例110', value: 24),
                    ], colors: [
                      Color(0xff1545FD),
                      Color(0xff0984F9)
                    ]),
                    ProgressBarBundle(barList: [
                      ProgressBarItem(text: '示例21', value: 20, hintValue: 15),
                      ProgressBarItem(
                          text: '示例22', value: 15, selectedHintText: '示例12:20'),
                      ProgressBarItem(
                          text: '示例23',
                          value: 30,
                          selectedHintText:'示例13:30'),
                      ProgressBarItem(text: '示例24', value: 20),
                      ProgressBarItem(text: '示例25', value: 28),
                      ProgressBarItem(text: '示例26', value: 25),
                      ProgressBarItem(text: '示例27', value: 17),
                      ProgressBarItem(text: '示例28', value: 14),
                      ProgressBarItem(text: '示例29', value: 36),
                      ProgressBarItem(text: '示例210', value: 29),
                    ], colors: [
                      Color(0xff01D57D),
                      Color(0xff01D57D)
                    ]),
                  ],
                  yAxis: ChartAxis(axisItemList: [
                    AxisItem(showText: '10'),
                    AxisItem(showText: '20'),
                    AxisItem(showText: '30')
                  ]),
                  singleBarWidth: 30,
                  barGroupSpace: 30,
                  barMaxValue: 60,
                  onBarItemClickInterceptor:
                      (barBundleIndex, barBundle, barGroupIndex, barItem) {
                    return true;
                  },
                ),
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
                        hotCityTitle: '热门城市',
                        hotCityList: hotCityList,
                        onValueChanged: (SelectCityModel model){
                          EasyLoading.showToast('${model.name}');
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
                  isDisable: true,
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

class RadarProvider extends RadarChartDataProvider {
  final Map<String, List<double>> dataList1;

  final Map<String, List<double>> dataList2;

  final int? sideCount;

  RadarProvider(this.sideCount, this.dataList1, this.dataList2);

  @override
  int getRadarCount() {
    return 2;
  }

  @override
  RadarChartStyle getRadarStyle(int radarIndex) {
    switch (radarIndex) {
      case 0:
        return const RadarChartStyle(
          strokeColor: Colors.blue,
          areaColor: Color(0x332196F3),
          dotted: true,
          dotColor: Colors.blue,
        );
      case 1:
        return const RadarChartStyle(
          strokeColor: Colors.green,
          areaColor: Color(0x334CAF50),
          dotted: true,
          dotColor: Colors.green,
        );
    }
    return const RadarChartStyle(
      strokeColor: Colors.blue,
      strokeWidth: 1,
      areaColor: Color(0x332196F3),
      dotted: true,
      dotColor: Colors.blue,
      dotRadius: 2,
    );
  }

  @override
  List<double> getRadarValues(int radarIndex) {
    switch (radarIndex) {
      case 0:
        return dataList1[sideCount.toString()]!;
      case 1:
        return dataList2[sideCount.toString()]!;
    }
    return dataList1[sideCount.toString()]!;
  }
}
