import 'package:bkd/route/app_router.dart';
import 'package:flutter/material.dart';

class CurrentContext {
  BuildContext context =
      AppRouter.router.routerDelegate.navigatorKey.currentContext!;
}
