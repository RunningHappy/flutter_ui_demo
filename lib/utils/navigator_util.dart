import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_project/router/application.dart';
import 'bundle_util.dart';

class NavigatorUtil {
  /// 打开新页面
  static void openWin(BuildContext context, String path,
      {String toast = '', Bundle? params, Function? callbackListener}) {
    if (toast != '') {
      EasyLoading.showToast(toast);
      Future.delayed(const Duration(milliseconds: 2500), () {
        Navigator.pushNamed(context, path, arguments: params).then((value) {
          try {
            callbackListener!(value);
          } catch (e) {}
        });
      });
    } else {
      Navigator.pushNamed(context, path, arguments: params).then((value) {
        try {
          callbackListener!(value);
        } catch (e) {}
      });
    }
  }

  /// 关闭当前页面跳转页面
  static void openReplaceWin(BuildContext context, String path,
      {String toast = '', Bundle? params}) {
    if (toast != '') {
      EasyLoading.showToast(toast);
      Future.delayed(const Duration(milliseconds: 2500), () {
        Navigator.pushReplacementNamed(context, path, arguments: params);
      });
    } else {
      Navigator.pushReplacementNamed(context, path, arguments: params);
    }
  }

  /// 关闭当前页面,返回上级页面
  static void closeWin(BuildContext context,
      {String toast = '', Function? callback}) {
    if (toast != '') {
      EasyLoading.showToast(toast);
      Future.delayed(const Duration(milliseconds: 2500), () {
        Navigator.pop(context);
        if (callback != null) {
          callback();
        }
      });
    } else {
      Navigator.pop(context);
    }
  }

  /// 返回到指定页面
  static void closeToWin(BuildContext context, String path,
      {bool? isRefresh,
        bool isFirstPage = false,
        String toast = '',
        Function? callback}) {
    // Navigator.of(context).popUntil((route) {
    //   return route.settings.name.startsWith(path);
    // });
    if (toast != '') {
      EasyLoading.showToast(toast);
      Future.delayed(const Duration(milliseconds: 2500), () {
        if (isFirstPage) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else {
          Navigator.popUntil(context, ModalRoute.withName(path));
        }
        if (callback != null) {
          callback();
        }
      });
    } else {
      if (isFirstPage) {
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        Navigator.popUntil(context, ModalRoute.withName(path));
      }
    }
  }

  /// 打开新页面并清掉栈中所有之前
  static void openWinCloseToALl(BuildContext context, String path,
      {String toast = '', bool? isRefresh}) {
    if (toast != '') {
      EasyLoading.showToast(toast);
      Future.delayed(const Duration(milliseconds: 2500), () {
        Application.router!.navigateTo(context, path,
            clearStack: true, transition: TransitionType.inFromRight);
      });
    } else {
      Application.router!.navigateTo(context, path,
          clearStack: true, transition: TransitionType.inFromRight);
    }
  }
}
