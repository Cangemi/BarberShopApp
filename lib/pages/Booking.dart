import 'package:flutter/material.dart';

import '../widgets/CustomElevatedButton.dart';
import 'Calendar.dart';

class Booking extends StatefulWidget {
  const Booking({Key? key}) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  late String service;
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  Color colorOne = Colors.yellow;
  Color colorTwo = Colors.yellow;
  Color colorThree = Colors.yellow;
  Color colorFour = Colors.yellow;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: height * 0.04,
          ),
          Text(
            "Como podemos te ajudar?",
            style: TextStyle(
                color: white, fontWeight: FontWeight.bold, fontSize: 22),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Text(
            "Clique no serviço que você precisa.",
            style: TextStyle(
                color: white, fontWeight: FontWeight.normal, fontSize: 16),
          ),
          SizedBox(
            height: height * 0.035,
          ),
          Container(
              height: height * 0.45,
              // padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.9,
                children: [
                  buildServices(
                      context,
                      "https://images.pexels.com/photos/10024234/pexels-photo-10024234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      "BARBA",
                      colorOne,
                      1),
                  buildServices(
                      context,
                      "https://images.pexels.com/photos/1804638/pexels-photo-1804638.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      "CABELO",
                      colorTwo,
                      2),
                  buildServices(
                      context,
                      "https://images.pexels.com/photos/7697394/pexels-photo-7697394.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      "CORTE KIDS",
                      colorThree,
                      3),
                  buildServices(
                      context,
                      "https://images.pexels.com/photos/3998404/pexels-photo-3998404.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940flutter",
                      "COMPLETO",
                      colorFour,
                      4),
                ],
              )),
          CustomElevatedButton(
            backgroundColor: yellowAccent,
            textColor: black,
            text: "ESCOLHER DATA E HORÁRIO",
            fontSize: 16,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Material(
                      color: Colors.transparent,
                      child: Container(
                        constraints: const BoxConstraints.expand(),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: yellowAccent,
                                style: BorderStyle.solid),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: const DecorationImage(
                              image: AssetImage("images/background.png"),
                              fit: BoxFit.cover,
                            )),
                        // decoration: BoxDecoration(color: black),
                        margin: EdgeInsets.only(
                            top: height * 0.04,
                            right: 10,
                            left: 10,
                            bottom: height * 0.04),
                        child: Calendar(
                          returnValues: (var context, int day, int weekDay,
                              int month, String hour) {
                            print(hour);
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  });
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => const Calendar()));
            },
          )
        ],
      )),
    );
  }

  GestureDetector buildServices(
      BuildContext context, String url, String text, Color color, int i) {
    return GestureDetector(
      onTap: () {
        service = text;
        print(service);
        if (i == 1) {
          setState(() {
            colorOne = yellowAccent;
            colorTwo = yellow;
            colorThree = yellow;
            colorFour = yellow;
          });
        } else if (i == 2) {
          setState(() {
            colorOne = yellow;
            colorTwo = yellowAccent;
            colorThree = yellow;
            colorFour = yellow;
          });
        } else if (i == 3) {
          setState(() {
            colorOne = yellow;
            colorTwo = yellow;
            colorThree = yellowAccent;
            colorFour = yellow;
          });
        } else {
          setState(() {
            colorOne = yellow;
            colorTwo = yellow;
            colorThree = yellow;
            colorFour = yellowAccent;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(url), fit: BoxFit.cover),
              ),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
