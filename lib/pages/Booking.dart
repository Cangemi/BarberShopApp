import 'package:barber_shop_app/widgets/BuildServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/appointmentsModel.dart';
import '../widgets/Appointments.dart';
import '../widgets/CustomElevatedButton.dart';
import '../models/calendar_client.dart';
import 'Calendar.dart';

class Booking extends StatefulWidget {
  final Query appoitments;
  const Booking({Key? key, required this.appoitments}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  int flag = 0;
  DateTime _date = DateTime.now();
  String service = "";
  List list = [];
  Map<String, dynamic> a = Map();
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  Color colorOne = Colors.yellow;
  Color colorTwo = Colors.yellow;
  Color colorThree = Colors.yellow;
  Color colorFour = Colors.yellow;
  late String _token = '';

  late List<appointmentsModel> appointmentsList = [];
  late List<appointmentsModel> appointmentsGeneralList = [];

  getUserId() async {
    final tokenSave = await SharedPreferences.getInstance();
    String? token = await tokenSave.getString("token");
    setState(() {
      _token = token!;
    });
  }

  message(String text) {
    final snackBar = SnackBar(
      backgroundColor: black,
      shape: Border(top: BorderSide(color: yellowAccent, width: 3)),
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: white, fontSize: 16),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(days: 1));
  CalendarClient calendarClient = CalendarClient();

  saveAppointment(String token, String hour, int day, int weekDay, int month,
      DateTime date, bool ativo) {
    FirebaseFirestore.instance.collection('appointments').add({
      'uid': token,
      'dia': day,
      'diaSemana': weekDay,
      'mes': month,
      'hora': hour,
      'servico': service,
      'ativo': ativo,
      'dataRegistro': date,
    });
  }

  updateAppointment(String id, String token, String hour, String service,
      int day, int weekDay, int month, DateTime date, bool ativo) {
    FirebaseFirestore.instance.collection('appointments').doc(id).set({
      'uid': token,
      'dia': day,
      'diaSemana': weekDay,
      'mes': month,
      'hora': hour,
      'servico': service,
      'ativo': ativo,
      'dataRegistro': date,
    });
  }

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    //print(appointmentsList.length);
    return SingleChildScrollView(
      child: StreamBuilder(
        stream: widget.appoitments.snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Erro ao conectar no Firebase'));
            case ConnectionState.waiting:
              return Container();
            default:
              final dados = snapshot.requireData;
              for (DocumentSnapshot ap in dados.docs) {
                appointmentsModel e = appointmentsModel.fromJson(
                    ap.data() as Map<String, dynamic>, ap.id);
                if (e.ativo == true) {
                  appointmentsGeneralList.add(e);
                  if (e.uid == _token) {
                    appointmentsList.add(e);
                  }
                }
              }
              print(appointmentsGeneralList
                  .any((element) => element.ativo == true));
              return appointmentsList.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      height: height - 100,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Seu agendamento foi concluído com sucesso!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            Appointments(
                              day: appointmentsList[0].day,
                              dayOfweek: appointmentsList[0].weekDay,
                              month: appointmentsList[0].month,
                              hour: appointmentsList[0].hour,
                              service: appointmentsList[0].service,
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Text(
                              "No menu abaixo você pode relembrar a data e horário do seu agendamento quando precisar.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16),
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            CustomElevatedButton(
                                backgroundColor: yellowAccent,
                                textColor: black,
                                text: 'Cancelar',
                                fontSize: 20,
                                onPressed: () {
                                  _date = DateTime.now();
                                  updateAppointment(
                                      appointmentsList[0].id!,
                                      _token,
                                      appointmentsList[0].hour,
                                      appointmentsList[0].service,
                                      appointmentsList[0].day,
                                      appointmentsList[0].weekDay,
                                      appointmentsList[0].month,
                                      _date,
                                      false);
                                  appointmentsList.clear();
                                  appointmentsGeneralList.clear();
                                })
                          ]),
                    )
                  : Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Text(
                            "Como podemos te ajudar?",
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            "Clique no serviço que você precisa.",
                            style: TextStyle(
                                color: white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: height * 0.035,
                          ),
                          BuildServices(
                              returnValues: (String value) => service = value),
                          CustomElevatedButton(
                            backgroundColor: yellowAccent,
                            textColor: black,
                            text: "ESCOLHER DATA E HORÁRIO",
                            fontSize: 16,
                            onPressed: () {
                              if (service == "") {
                                message("Escolha um serviço");
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: Container(
                                          constraints:
                                              const BoxConstraints.expand(),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: yellowAccent,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                              image: const DecorationImage(
                                                image: AssetImage(
                                                    "images/background.png"),
                                                fit: BoxFit.cover,
                                              )),
                                          // decoration: BoxDecoration(color: black),
                                          margin: EdgeInsets.only(
                                              top: height * 0.04,
                                              right: 10,
                                              left: 10,
                                              bottom: height * 0.04),
                                          child: Calendar(
                                            appointmentsGeneralList:
                                                appointmentsGeneralList,
                                            returnValues: (var context,
                                                int day,
                                                int weekDay,
                                                int month,
                                                String hour) {
                                              Navigator.pop(context);
                                              if (day < _date.day) {
                                                message(
                                                    "Esse dia não esta mais disponivel");
                                              } else {
                                                _date = DateTime.now();
                                                saveAppointment(
                                                    _token,
                                                    hour,
                                                    day,
                                                    weekDay,
                                                    month,
                                                    _date,
                                                    true);
                                                appointmentsList.clear();
                                                appointmentsGeneralList.clear();
                                              }

                                              //-----------------------------------------
                                            },
                                          ),
                                        ),
                                      );
                                    });
                              }
                            },
                          )
                        ],
                      )),
                    );
          }
        },
      ),
    );
  }
}
