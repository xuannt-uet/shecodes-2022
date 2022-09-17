import 'package:shecodes2022/page/doctor_details/doctor_details.dart';
import 'package:shecodes2022/page/home/home_page.dart';
import 'package:shecodes2022/page/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:shecodes2022/page/register/register_page.dart';

enum RouteDefine {
  login,
  register,
  home,
  doctorDetails,
}

class AppRouting {
  static final mainNavigationKey = GlobalKey<NavigatorState>();

  static CupertinoPageRoute generateMainRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.login.name: (_) => const LoginPage(),
      RouteDefine.register.name: (_) => const RegisterPage(),
      RouteDefine.home.name: (_) => const HomePage(),
      RouteDefine.doctorDetails.name: (_) => DoctorDetails(doctorId: settings.arguments.toString()),
    };

    final routeBuilder = routes[settings.name];

    return CupertinoPageRoute(
      builder: routeBuilder!,
      settings: RouteSettings(name: settings.name),
    );
  }
}
