import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    Color yellowAccent= Colors.yellowAccent;
    Color black = Colors.black87;
    Color yellow= Colors.yellow;
    Color white = Colors.white;

    var size = MediaQuery.of(context).size;
    double height = size.height;
    var width = size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(image: new AssetImage("images/background.png"), fit: BoxFit.cover,),
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Container(
                padding: EdgeInsets.all(41),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     SizedBox(
                      height: height*0.02,
                    ),
                    Text("BarberShop",
                        style: GoogleFonts.pacifico(
                          fontSize: 35,
                          color: yellowAccent,
                          fontStyle: FontStyle.italic,
                        )),
                     SizedBox(
                      height: height*0.01,
                    ),
                    Text(
                        "Cadastre-se gratuitamente para agendar seu atendimento.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: white,
                      ),
                    ),
                    SizedBox(
                      height: height*0.06,
                    ),
                    Container(
                      child: Text(
                        "E-mail",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
