import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shecodes2022/config/app_color.dart';
import 'package:shecodes2022/fragment/common_buttom.dart';
import 'package:shecodes2022/fragment/default_page.dart';
import 'package:shecodes2022/model/doctor/doctor.dart';
import 'package:shecodes2022/page/booking/booking_cubit.dart';
import 'package:shecodes2022/utils/app_routing.dart';
import 'package:sizer/sizer.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime initDate = DateTime.now();
  final _bookingCubit = BookingCubit();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Book appointment',
      body: SizedBox(
        height: 85.h,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                chooseDateWidget(),
                chooseTimeSlotsWidget(),
                chooseServices(),
              ],
            ),
            Positioned(
              bottom: 4.h,
              left: 5.w,
              right: 5.w,
              child: bookingButton(),
            ),
          ],
        ),
      ),
      scrollable: true,
    );
  }

  Widget chooseDateWidget() {
    return GestureDetector(
      onTap: () async {
        initDate = (await showDatePicker(
              context: context,
              initialDate: initDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 20)),
            )) ??
            initDate;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2.h),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          DateFormat('yMMMd').format(initDate).toString(),
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColor.hintTextColor),
        ),
      ),
    );
  }

  Widget chooseTimeSlotsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 2.w),
          child: Text(
            'Time slot:',
            style: TextStyle(color: AppColor.textColor, fontSize: 14.sp),
          ),
        ),
        Container(
          width: 100.w,
          margin: EdgeInsets.only(top: 1.h),
          alignment: Alignment.center,
          child: Wrap(
            children: _bookingCubit.timeSlot.freeTime!
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1.h),
                    child: Opacity(
                      opacity: _bookingCubit.listTapped[e.key] ? 1 : 0.5,
                      child: BorderedButton(
                        width: 20.w,
                        onTap: () {
                          _bookingCubit.listTapped[e.key] = !_bookingCubit.listTapped[e.key];
                          setState(() {});
                        },
                        actionTitle: DateFormat('hh:mm').format(e.value),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget chooseServices() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: 2.w, top: 2.h),
        child: Text(
          'Services:',
          style: TextStyle(color: AppColor.textColor, fontSize: 14.sp),
        ),
      ),
      ..._bookingCubit.services
          .asMap()
          .entries
          .map(
            (e) => Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h),
              child: CheckboxListTile(
                value: _bookingCubit.listSelect[e.key],
                dense: true,
                contentPadding: EdgeInsets.zero,
                onChanged: (bool? value) {
                  _bookingCubit.listSelect[e.key] = value!;
                  setState(() {});
                },
                activeColor: AppColor.themeColor,
                controlAffinity: ListTileControlAffinity.leading,
                title: RichText(
                  text: TextSpan(
                    text: '${e.value.name}\n',
                    style: TextStyle(fontSize: 14.sp, color: AppColor.textColor),
                    children: <TextSpan>[
                      TextSpan(text: 'Price: ${e.value.price}', style: const TextStyle(color: AppColor.starColor)),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    ]);
  }

  Widget bookingButton() {
    return Center(
      child: CommonButton(
        onTap: () {
          // Navigator.pushNamed(context, RouteDefine.bookingDetails.name);
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Request has been sent. Thank you!'),
              );
            },
          ).whenComplete(() => Navigator.pushReplacementNamed(context, RouteDefine.home.name));
        },
        width: 80.w,
        actionTitle: 'Book appointment',
      ),
    );
  }
}
