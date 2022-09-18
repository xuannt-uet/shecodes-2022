import 'package:shecodes2022/model/doctor/doctor.dart';
import 'package:shecodes2022/page/booking/booking_page.dart';
import 'package:shecodes2022/page/booking_details/booking_details_page.dart';
import 'package:shecodes2022/page/doctor_details/doctor_details.dart';
import 'package:shecodes2022/page/home/home_page.dart';
import 'package:shecodes2022/page/login/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:shecodes2022/page/register/register_page.dart';
import 'package:shecodes2022/page/splash/splash.dart';

enum RouteDefine {
  splash,
  login,
  register,
  home,
  doctorDetails,
  booking,
  bookingDetails,
}

class AppRouting {
  static final mainNavigationKey = GlobalKey<NavigatorState>();

  static CupertinoPageRoute generateMainRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.splash.name: (_) => const SplashPage(),
      RouteDefine.login.name: (_) => const LoginPage(),
      RouteDefine.register.name: (_) => const RegisterPage(),
      RouteDefine.home.name: (_) => const HomePage(),
      RouteDefine.doctorDetails.name: (_) => DoctorDetails(doctor: settings.arguments as Doctor),
      RouteDefine.booking.name: (_) => const BookingPage(),
      RouteDefine.bookingDetails.name: (_) => const BookingDetailsPage(),
    };

    final routeBuilder = routes[settings.name];

    return CupertinoPageRoute(
      builder: routeBuilder!,
      settings: RouteSettings(name: settings.name),
    );
  }
}
