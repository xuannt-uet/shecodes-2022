
import 'package:shecodes2022/page/login/login_page.dart';
import 'package:flutter/cupertino.dart';

enum RouteDefine {
  login,
}

class AppRouting {
  static final mainNavigationKey = GlobalKey<NavigatorState>();

  static CupertinoPageRoute generateMainRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.login.name: (_) => const LoginPage(),
      // RouteDefine.listSeat.name: (_) => ListSeats(showId: '${settings.arguments}'),
      // RouteDefine.booking.name: (_) => Booking(bookingArg: settings.arguments as BookingArg),
    };

    final routeBuilder = routes[settings.name];

    return CupertinoPageRoute(
      builder: routeBuilder!,
      settings: RouteSettings(name: settings.name),
    );
  }
}
