import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/fragment/common_buttom.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';
import 'package:sizer/sizer.dart';

class DoctorDetails extends StatefulWidget {
  final String doctorId;

  const DoctorDetails({Key? key, required this.doctorId}) : super(key: key);

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  final doctor = Doctor(
    name: 'Doctor 2',
    phoneNumber: '08826362',
    rating: 4.5,
    dateOfBirth: DateTime(1997, 08, 15),
    address: 'so 1 duong NDC',
    description: 'ABC doctor provjp benh nao cung chua duoc nao cung chua duoc',
    avatar: 'https://vfdc.com.vn/wp-content/uploads/2020/12/wysiwyg-uploads_1569586526901-doctor.jpg',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: SizedBox(
          height: 80.h,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    actionButtons(),
                    moreDoctorInformation(),
                  ],
                ),
              ),
              Positioned(
                bottom: 4.h,
                left: 5.w,
                right: 5.w,
                child: bookAppointmentButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize appbarWidget() {
    return PreferredSize(
      preferredSize: Size.fromHeight(15.h), // Set this height
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: const [0.1, 0.9],
            colors: [const Color(0xFF21C8D1), AppColor.themeColor.withOpacity(0.8)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 3.h),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: AppColor.whiteColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundImage: NetworkImage(doctor.avatar!),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name!,
                      style: TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.w700, fontSize: 18.sp),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.themeColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.star_border_outlined,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        RichText(
                          text: TextSpan(
                            text: '${doctor.rating}\n',
                            style: TextStyle(color: AppColor.whiteColor, fontWeight: FontWeight.w500, fontSize: 11.sp),
                            children: const <TextSpan>[
                              TextSpan(text: 'rating'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BorderedButton(onTap: () {}, actionTitle: 'Audio call', width: 30.w),
        BorderedButton(onTap: () {}, actionTitle: 'Video call', width: 30.w),
        BorderedButton(onTap: () {}, actionTitle: 'Message call', width: 30.w),
      ],
    );
  }

  Widget moreDoctorInformation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RatingBarIndicator(
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 18,
            rating: doctor.rating!,
          ),
          SizedBox(height: 2.h),
          Text(
            'About doctor',
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            doctor.description!,
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            'Services',
            style: TextStyle(
              color: AppColor.textColor,
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget bookAppointmentButton() {
    return CommonButton(
      onTap: () {},
      width: 80.w,
      actionTitle: 'Book appointment',
    );
  }
}
