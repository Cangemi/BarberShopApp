import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'About.dart';
import 'Booking.dart';
import 'PreviousAppointments.dart';
import 'Profile.dart';
import 'Services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  int currentIndex = 3;
  List<Widget> screens = [
    const Profile(),
    Center(
      child: PreviousAppointments(),
    ),
    const Services(),
    const Booking()
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("images/background.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: yellowAccent,
          title: Center(
              child: Text("BarberShop",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.pacifico(
                    fontSize: 25,
                    color: black,
                    fontStyle: FontStyle.italic,
                  ))),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const About();
                      });
                },
                icon: Icon(
                  Icons.info_outline,
                  color: black,
                ))
          ],
        ),
        body: Container(
          height: height,
          padding: const EdgeInsets.all(16),
          child: screens[currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: yellowAccent,
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black87,
          items: const [
            BottomNavigationBarItem(label: "Perfil", icon: Icon(Icons.person)),
            BottomNavigationBarItem(
                label: "Agendados", icon: Icon(Icons.calendar_today_sharp)),
            BottomNavigationBarItem(
                label: "Serviços", icon: Icon(Icons.hail_rounded)),
            BottomNavigationBarItem(
                label: "Agendar", icon: Icon(Icons.add_circle_rounded)),
          ],
        ),
      ),
    );
  }
}
