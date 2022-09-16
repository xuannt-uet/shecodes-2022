import 'package:shecodes2022/service_locator.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

void main() {
  ServiceLocator.setupDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     systemNavigationBarColor: Colors.transparent,
  //     systemNavigationBarIconBrightness: Brightness.dark,
  //     systemNavigationBarDividerColor: Colors.transparent,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }

    return GestureDetector(
      onTap: hideKeyboard,
      child: Sizer(
        builder: (context, orientation, deviceType) {
          (deviceType == DeviceType.tablet)
              ? SystemChrome.setPreferredOrientations(DeviceOrientation.values)
              : SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
          return MaterialApp(
            initialRoute: RouteDefine.login.name,
            navigatorKey: AppRouting.mainNavigationKey,
            onGenerateRoute: AppRouting.generateMainRoute,
            builder: EasyLoading.init(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal),
              fontFamily: 'Amiko',
              textTheme: TextTheme(
                bodyText1: TextStyle(fontSize: 16.sp),
              ),
            ),
          );
        },
      ),
    );
  }
}
