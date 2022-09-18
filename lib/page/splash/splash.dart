import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/page/splash/splash_bloc.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:sizer/sizer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.themeColor.withOpacity(0.6),
      body: BlocProvider(
        create: (context) => SplashBloc()..add(InitStart()),
        child: BlocListener<SplashBloc, SplashState>(
          listener: (context, state) {
            if (state is Authenticated) {
              Navigator.pushReplacementNamed(context, RouteDefine.home.name);
            }
            if (state is NotAuthenticated) {
              Navigator.pushReplacementNamed(context, RouteDefine.login.name);
            }
          },
          child: Center(
            child: Image.asset('assets/images/app_logo.png', width: 70.w),
          ),
        ),
      ),
    );
  }
}
