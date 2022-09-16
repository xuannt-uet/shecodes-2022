import 'package:shecodes2022/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final bool scrollable;
  final bool isBack;
  final Function()? onWillPop;
  final Widget? bottomWidget;
  final Widget? action;
  final Widget? titleAction;

  const AppScaffold({
    required this.title,
    required this.body,
    this.scrollable = true,
    this.isBack = true,
    Key? key,
    this.onWillPop,
    this.bottomWidget,
    this.action,
    this.titleAction,
  }) : super(key: key);

  Future<bool> _willPopCallback() async {
    onWillPop?.call();
    return Future.value(isBack);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(title),
          leading: isBack
              ? IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined, size: 18.sp, color: Colors.white),
                  onPressed: Navigator.of(context).pop,
                )
              : null,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              color: AppColor.backgroundColor,
            ),
            child: scrollable ? SingleChildScrollView(child: body) : body,
          ),
        ),
        bottomNavigationBar: bottomWidget,
      ),
    );
  }
}
