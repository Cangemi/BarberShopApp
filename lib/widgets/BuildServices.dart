import 'package:flutter/material.dart';

class BuildServices extends StatefulWidget {
  final Function returnValues;
  const BuildServices({Key? key, required this.returnValues}) : super(key: key);

  @override
  State<BuildServices> createState() => _BuildServicesState();
}

class _BuildServicesState extends State<BuildServices> {
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Color.fromARGB(199, 255, 235, 59);
  Color white = Colors.white;
  Color colorOne = Color.fromARGB(199, 255, 235, 59);
  Color colorTwo = Color.fromARGB(199, 255, 235, 59);
  Color colorThree = Color.fromARGB(199, 255, 235, 59);
  Color colorFour = Color.fromARGB(199, 255, 235, 59);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
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
        ));
  }

  GestureDetector buildServices(
      BuildContext context, String url, String text, Color color, int i) {
    return GestureDetector(
      onTap: () {
        widget.returnValues(text);
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
