import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/appointmentsModel.dart';
import '../widgets/Appointments.dart';

class PreviousAppointments extends StatefulWidget {
  final Query appoitments;
  PreviousAppointments({Key? key, required this.appoitments}) : super(key: key);

  @override
  State<PreviousAppointments> createState() => _PreviousAppointmentsState();
}

class _PreviousAppointmentsState extends State<PreviousAppointments> {
  Color yellowAccent = Colors.yellowAccent;

  Color black = Colors.black87;

  Color yellow = Colors.yellow;

  Color white = Colors.white;

  String _token = "";

  var appointments;

  getUserId() async {
    final tokenSave = await SharedPreferences.getInstance();
    String? token = await tokenSave.getString("token");
    setState(() {
      _token = token!;
    });
  }

  Widget item(item) {
    appointmentsModel a = appointmentsModel.fromJson(
        item.data() as Map<String, dynamic>, item.id);
    return Container(
      child: Appointments(
        day: a.day,
        dayOfweek: a.weekDay,
        month: a.month,
        hour: a.hour,
        service: a.service,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    appointments = widget.appoitments
        .where("uid", isEqualTo: _token)
        .where('ativo', isEqualTo: false)
        .orderBy("dataRegistro", descending: true);
    return StreamBuilder(
        stream: appointments.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Center(
                  child: Text(
                'Erro ao conectar no Firebase',
                style: TextStyle(color: white),
              ));
            case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(
                color: yellowAccent,
              ));
            default:
              final dados = snapshot.requireData;
              print(_token);
              print(dados.size);
              return dados.size > 0
                  ? ListView.builder(
                      itemCount: dados.size,
                      itemBuilder: (context, index) {
                        return item(dados.docs[index]);
                      },
                    )
                  : Center(
                      child: Text('Não possui histórico',
                          style: TextStyle(color: white, fontSize: 18)));
          }
        });
  }
}
