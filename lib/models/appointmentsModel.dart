class appointmentsModel {
  String? id;
  String uid;
  String service;
  String hour;
  int day;
  int weekDay;
  int month;
  bool ativo;
  DateTime dataRegister;

  appointmentsModel(
      {this.id,
      required this.uid,
      required this.service,
      required this.day,
      required this.weekDay,
      required this.month,
      required this.hour,
      required this.ativo,
      required this.dataRegister});

  factory appointmentsModel.fromJson(Map<String, dynamic> map, String id) {
    return appointmentsModel(
        id: id,
        uid: map['uid'],
        service: map['servico'],
        day: map['dia'],
        weekDay: map['diaSemana'],
        month: map['mes'],
        ativo: map['ativo'],
        hour: map['hora'],
        dataRegister: DateTime.parse(map['dataRegistro'].toDate().toString()));
  }
}
