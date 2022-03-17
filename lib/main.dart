import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_project/router/application.dart';
import 'package:new_project/splash_page/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:new_project/utils/fz_localizations_delegate.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    /// 初始化路由
    final router = FluroRouter.appRouter;
    Application.configureRoutes(router);

    /// 这里设置项目环境
    Application.router = router;

    /// 透明状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: Constant.PROJECT_NAME,
        theme: ThemeData(
          fontFamily: "pingfang",
          primaryColor: const Color(0xFF177FF3),
          scaffoldBackgroundColor: const Color(0xFFF5F5F5),
          /// 对话框背景颜色
          dialogBackgroundColor: Colors.white,
          // / 设置App导航栏主题
          appBarTheme: const AppBarTheme(
            elevation: 0,
            centerTitle: true,
            brightness: Brightness.light
          ),
          dividerTheme: const DividerThemeData(
            space: 0,
          ),
          /// dividerColor: Color(KColors.divider_color),
          /// 通用文本信息设置
          textTheme: const TextTheme(
            bodyText1: TextStyle(
              color: Color(0xFF1D2023),
              fontWeight: FontWeight.w400
            )
          ),
        ),
        onGenerateRoute: Application.router!.generator,
        initialRoute: '/',
        builder:  EasyLoading.init(builder: (context, widget) {
          return MediaQuery(
            /// 设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        }),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          /// 注册我们的Delegate
          FZLocalizationDelegate.delegate
        ],
        supportedLocales: const [
          Locale('zh', 'CN'),
          Locale('en', 'US'),
        ],
      ),
    );
  }
}

/// 入口处
class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SplashPage();
  }
}
