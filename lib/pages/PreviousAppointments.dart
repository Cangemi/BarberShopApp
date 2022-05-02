import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/Appointments.dart';

class PreviousAppointments extends StatelessWidget {
  PreviousAppointments({Key? key}) : super(key: key);

  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;

  var list = [
    const Appointments(
      day: 4,
      dayOfweek: 7,
      month: 12,
      hour: "16:00",
      service: "Combo completo",
    ),
    const Appointments(
      day: 18,
      dayOfweek: 2,
      month: 2,
      hour: "18:30",
      service: "Corte Kids",
    )
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    return ListView(
      children: const <Widget>[
        Appointments(
          day: 4,
          dayOfweek: 7,
          month: 12,
          hour: "16:00",
          service: "Combo completo",
        ),
        Appointments(
          day: 18,
          dayOfweek: 2,
          month: 2,
          hour: "18:30",
          service: "Corte Kids",
        ),
      ],
    );
  }
}
