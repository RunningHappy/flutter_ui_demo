import 'package:fluro/fluro.dart';
import 'package:new_project/router/page_routers.dart';

class Application {
  static FluroRouter? router;

  static void configureRoutes(FluroRouter router) {
    PageRoutes.pageRoutesMap.forEach((key, val)
      {
        router.define(
          key,
          handler: val.getHandler(),
          transitionType: TransitionType.inFromRight
        );
      }
    );
  }
}
