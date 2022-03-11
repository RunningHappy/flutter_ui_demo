import 'package:flutter/material.dart';

/// Form 表单外必须包裹,点击隐藏键盘
class FormHideKeyboardWidget extends GestureDetector {

  final Widget childWidget;
  FormHideKeyboardWidget({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      behavior: HitTestBehavior.translucent, // 自身和子widget
      child: childWidget,
      onTap: () {
        hideKeyboard(context);
      },
    );
  }
}

/// 请求焦点  隐藏键盘
void hideKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
