import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_project/utils/bundle_util.dart';

typedef HandlerFunc = Widget? Function(BuildContext? context, Map<String, List<String>> parameters);
typedef PageBuilderFunc = Widget Function(Bundle bundle);

class PageBuilder {
  final PageBuilderFunc builder;
  late final HandlerFunc handlerFunc;

  PageBuilder({required this.builder}) {
    handlerFunc = (context, _) {
      if (ModalRoute.of(context!)!.settings.arguments == null) {
        return builder(Bundle());
      }
      return builder(ModalRoute.of(context)!.settings.arguments as Bundle);
    };
  }

  Handler getHandler() {
    return Handler(handlerFunc: handlerFunc);
  }
}
