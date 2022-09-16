import 'package:flutter/material.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:sizer/sizer.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final String actionTitle;
  late final double width;
  late final double height;
  final double radius;

  CommonButton({
    super.key,
    required this.onTap,
    required this.actionTitle,
    this.backgroundColor = AppColor.themeColor,
    this.radius = 5,
    double? width,
  }) : width = width ?? 40.w;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
          decoration: BoxDecoration(
            color: AppColor.themeColor,
            borderRadius: BorderRadius.circular(radius),
          ),
          alignment: Alignment.center,
          width: width,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            actionTitle,
            style: TextStyle(color: AppColor.whiteColor, fontSize: 15.sp),
          ),
        ),
  );
}

class CircleButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final bool mini;

  const CircleButton({
    required this.icon,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.foregroundColor,
    this.padding,
    this.mini = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: FloatingActionButton(
        onPressed: onPressed,
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        heroTag: key,
        mini: mini,
        child: icon,
      ),
    );
  }
}
