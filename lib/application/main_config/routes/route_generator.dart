// part of 'route_import.dart';

import 'package:provider/provider.dart';
import 'package:todo/application/main_config/routes/route_import.dart';
import 'package:todo/provider/login_view_model.dart';
import 'package:todo/provider/todo_view_model.dart';
import 'package:todo/ui/login/login_screen.dart';
import 'package:todo/ui/todo/todo_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RoutePath.initialRoute:
        return PageRouter.fadeScale(() => SplashScreen());
      case RoutePath.loginScreen:
        return PageRouter.fadeScale(() => ChangeNotifierProvider(create: (c) => AuthViewModel(), child: LoginScreen()));

      case RoutePath.changePasswordScreen:
        return PageRouter.fadeScale(() => ChangeNotifierProvider(create: (c) => TodoViewModel(), child: TodoScreen(userId: '')));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: Center(
          child: Container(
            color: Style.scaffoldBackground,
            child: const Text('Page Not Found'),
          ),
        ),
      );
    });
  }
}
