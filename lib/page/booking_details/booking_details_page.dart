import 'package:flutter/material.dart';
import 'package:shecodes2022/fragment/default_page.dart';

class BookingDetailsPage extends StatefulWidget {
  const BookingDetailsPage({Key? key}) : super(key: key);

  @override
  State<BookingDetailsPage> createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Booking details',
      body: Container(),
    );
  }
}
