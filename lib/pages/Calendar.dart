import 'package:barber_shop_app/widgets/CustomTabBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../models/appointmentsModel.dart';
import '../widgets/CustomElevatedButton.dart';

class Calendar extends StatefulWidget {
  final Function returnValues;
  final List<appointmentsModel> appointmentsGeneralList;
  const Calendar(
      {Key? key,
      required this.returnValues,
      required this.appointmentsGeneralList})
      : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  DateTime _today = DateTime.now();
  String _hour = " ";
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  int flag = 0;
  final List<String> hourList = [
    "13:00",
    "14:00",
    "15:00",
    "16:00",
    "17:00",
    "18:00",
  ];
  List<String> hList = [];

  getHour() {
    print("DIA: ---- ${_selectedDay.day}");
    print(_selectedDay.isAtSameMomentAs(_today));
    if (_selectedDay.isAfter(_today) ||
        _selectedDay.day == _today.day &&
            _selectedDay.month == _today.month &&
            _selectedDay.year == _today.year) {
      print("Entrou aqui");
      for (appointmentsModel i in widget.appointmentsGeneralList) {
        if (i.day == _selectedDay.day && i.month == _selectedDay.month) {
          setState(() {
            flag = 0;
            hList.remove(i.hour);
          });
        } else {
          setState(() {
            flag = 0;
            hList = [
              "13:00",
              "14:00",
              "15:00",
              "16:00",
              "17:00",
              "18:00",
            ];
          });
        }
      }
    } else {
      setState(() {
        flag = 1;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    hList = hourList;
    getHour();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: const EdgeInsets.only(right: 20, left: 20),
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.15,
              ),
              Text(
                "Agendamento",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                "Escolha a data e horário:",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.normal, fontSize: 16),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              buildCalendar(),
              SizedBox(
                height: height * 0.02,
              ),
              flag == 0
                  ? CustomTabBar(
                      list: hList,
                      backgroundColor: black,
                      borderColor: yellowAccent,
                      textColor: yellowAccent,
                      returnHour: (String value) => _hour = value,
                    )
                  : Container(
                      padding: const EdgeInsetsDirectional.all(10),
                      child: Text(
                        "Não possui horários para esta data",
                        style: TextStyle(color: yellowAccent, fontSize: 18),
                      ),
                    ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomElevatedButton(
                  backgroundColor:
                      flag == 0 ? yellowAccent : Colors.grey.shade500,
                  textColor: black,
                  text: "CONFIRMAR AGENDAMENTO",
                  fontSize: 16,
                  onPressed: () {
                    print("AQUI: ${_selectedDay}");
                    widget.returnValues(
                        context,
                        _selectedDay.day,
                        _selectedDay.weekday,
                        _selectedDay.month,
                        _hour == " " ? hList[0] : _hour);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Container buildCalendar() {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: black,
        border: Border.all(width: 2, color: yellowAccent),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TableCalendar(
        locale: 'pt_BR',
        rowHeight: 35,
        firstDay: DateTime.utc(2022, 01, 01),
        lastDay: DateTime.utc(2050, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        availableGestures: AvailableGestures.horizontalSwipe,
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(
            color: yellowAccent,
            fontSize: 20,
          ),
          formatButtonTextStyle: TextStyle(color: yellowAccent),
          formatButtonDecoration: BoxDecoration(
            border: Border.all(width: 2, color: yellowAccent),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          leftChevronIcon: Icon(
            Icons.keyboard_arrow_left,
            color: yellowAccent,
          ),
          rightChevronIcon: Icon(
            Icons.keyboard_arrow_right,
            color: yellowAccent,
          ),
          decoration: BoxDecoration(color: black),
        ),
        calendarStyle: CalendarStyle(
          defaultTextStyle: TextStyle(color: yellowAccent),
          selectedTextStyle:
              TextStyle(color: black, fontWeight: FontWeight.bold),
          holidayTextStyle: TextStyle(color: white),
          todayTextStyle: TextStyle(color: black, fontWeight: FontWeight.bold),
          disabledTextStyle: TextStyle(color: yellow),
          weekendTextStyle: TextStyle(color: white),
          rowDecoration: BoxDecoration(color: black),
          disabledDecoration: BoxDecoration(color: black),
          todayDecoration: BoxDecoration(
            color: white,
            shape: BoxShape.circle,
          ),
          selectedDecoration: BoxDecoration(
            color: yellowAccent,
            shape: BoxShape.circle,
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: yellowAccent),
            weekendStyle: TextStyle(color: yellow),
            decoration: BoxDecoration(color: black)),
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
              getHour();
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
