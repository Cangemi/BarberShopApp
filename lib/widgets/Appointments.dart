import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  final int dayOfweek;
  final int day;
  final int month;
  final String hour;
  final String service;
  const Appointments({
    Key? key,
    required this.dayOfweek,
    required this.day,
    required this.month,
    required this.hour,
    required this.service,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color yellowAccent = Colors.yellowAccent;
    Color black = Colors.black87;
    Color yellow = Colors.yellow;
    Color white = Colors.white;

    String dayWeek = week(dayOfweek);
    String monthName = nameOfMonth(month);

    var size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      height: 150,
      //width: 200,
      margin: EdgeInsets.only(top: 30, right: width * 0.02, left: width * 0.02),
      padding: EdgeInsets.only(
          right: 40, left: 40, top: height * 0.05, bottom: height * 0.04),
      decoration: BoxDecoration(
          color: black,
          border: Border.all(color: yellow, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Column(children: [
        field("Data: ", "$dayWeek, $day de $monthName", yellow, white),
        const SizedBox(
          height: 3,
        ),
        field("Horário: ", hour, yellow, white),
        const SizedBox(
          height: 3,
        ),
        field("Serviço: ", service, yellow, white)
      ]),
    );
  }

  Row field(String label, String text, Color yellow, Color white) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
              color: yellow, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          text,
          style: TextStyle(color: white, fontSize: 16),
        )
      ],
    );
  }

  String week(int dayOfWeek) {
    late String day;
    switch (dayOfWeek) {
      case 1:
        day = "Segunda";
        break;
      case 2:
        day = "Terça";
        break;
      case 3:
        day = "Quarta";
        break;
      case 4:
        day = "Quinta";
        break;
      case 5:
        day = "Sexta";
        break;
      case 6:
        day = "Sábado";
        break;
      case 7:
        day = "Domingo";
        break;
    }
    return day;
  }

  String nameOfMonth(int month) {
    late String mon;
    switch (month) {
      case 1:
        mon = "Janeiro";
        break;
      case 2:
        mon = "Fevereiro";
        break;
      case 3:
        mon = "Março";
        break;
      case 4:
        mon = "Abril";
        break;
      case 5:
        mon = "Maio";
        break;
      case 6:
        mon = "Junho";
        break;
      case 7:
        mon = "Julho";
        break;
      case 8:
        mon = "Agosto";
        break;
      case 9:
        mon = "Setembro";
        break;
      case 10:
        mon = "Outubro";
        break;
      case 11:
        mon = "Novembro";
        break;
      case 12:
        mon = "Dezembro";
        break;
    }
    return mon;
  }
}
