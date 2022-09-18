import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/config/appplication.dart';
import 'package:shecodes2022/fragment/form_element.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';
import 'package:shecodes2022/page/home/home_cubit.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeCubit = HomeCubit();
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.black));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      appBar: appbarWidget(),
      body: BlocBuilder<HomeCubit, HomeState>(
        bloc: _homeCubit,
        builder: (context, state){
          if(state is HomeLoading){
            return const CircularProgressIndicator();
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchBar(),
                    SizedBox(height: 1.h),
                    Text(
                      'Near you:',
                      style: TextStyle(color: AppColor.textColor, fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 1.h),
                    ..._homeCubit.doctors.map((e) => doctorWidget(e)).toList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSize appbarWidget() {
    return PreferredSize(
      preferredSize: Size.fromHeight(8.h),
      child: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 7.w,
            backgroundImage: NetworkImage(_homeCubit.img),
            backgroundColor: Colors.transparent,
          ),
        ),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${Application.sharePreference.getString('userName')}',
              style: TextStyle(color: AppColor.whiteColor, fontSize: 15.sp, fontWeight: FontWeight.w700),
            ),
            Text(
              'Find your suitable doctor',
              style: TextStyle(color: AppColor.whiteColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                Application.sharePreference.clear();
                Navigator.popAndPushNamed(context, RouteDefine.login.name);
              },
              icon: Icon(Icons.logout, color: AppColor.whiteColor, size: 24.sp),
            ),
          )
        ],
      ),
    );
  }

  Widget doctorWidget(Doctor doctor) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RouteDefine.doctorDetails.name, arguments: doctor);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 3.h),
        padding: EdgeInsets.all(1.5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.backgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 7.w + 1,
              backgroundColor: Colors.teal,
              child: CircleAvatar(
                radius: 7.w,
                backgroundImage: NetworkImage(doctor.avatar!),
                backgroundColor: Colors.transparent,
              ),
            ),
            SizedBox(width: 3.w),
            SizedBox(
              width: 65.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor.name!,
                    style: TextStyle(color: AppColor.textColor, fontSize: 15.sp, fontWeight: FontWeight.w700),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: AppColor.starColor, size: 15.sp),
                      SizedBox(width: 1.w),
                      Text(doctor.rating.toString(), style: TextStyle(fontSize: 13.sp, color: AppColor.hintTextColor))
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    doctor.description!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColor.textColor, fontSize: 12.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return FormElement(
      name: 'search',
      type: FieldType.search,
      hintText: 'Search',
      onChanged: (dynamic value) {

      },
    );
  }
}
