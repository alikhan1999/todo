import 'package:flutter/material.dart';
import 'package:todo/application/core/scroll_behavior.dart';
import 'package:todo/application/main_config/routes/route_generator.dart';
import 'package:todo/application/main_config/routes/route_path.dart';
import 'package:todo/common/app_theme.dart';
import 'package:todo/constant/style.dart';
import 'package:todo/main.dart';
import 'package:todo/ui/base/base_mixin.dart';

class todo extends StatelessWidget with BaseMixin {
  final SetRegisteredRoutes? route;
  todo({super.key, this.route});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'todo',
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: CustomScrollBehavior(),
            child: child ?? const SizedBox(),
          );
        },
        initialRoute: RoutePath.initialRoute,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigator.key(),
        color: Style.primaryColor,
        theme: AppTheme.getAppThemeData());
  }
}
