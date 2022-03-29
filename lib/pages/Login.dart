import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
      Color yellowAccent= Colors.yellowAccent;
    Color black = Colors.black87;
    Color yellow= Colors.yellow;
    Color white = Colors.white;

    TextEditingController email = TextEditingController();
    TextEditingController senha = TextEditingController();
    var form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {


    
    var size = MediaQuery.of(context).size;
    double height = size.height;
    var width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage("images/background.png"), fit: BoxFit.cover,),
            ),
          ),
          SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(41),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     SizedBox(
                      height: height*0.02,
                    ),
                    Text("BarberShop",
                    textAlign: TextAlign.center,
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
                    Form(
                      child: Column(
                        key: form,
                        children: [
                          textField("E-mail", email,"josefernando21@gmail.com"),
                          textField("Senha", senha,"123456"),
                        ],
                        )
                      ),
                    // SizedBox(
                    //   height: height*0.35,
                    // ),
                  ],
                ),
              ),
          )
        ],
      ),
    );
  }
  textField(label, variable, hint){
    return TextFormField(
      style: const TextStyle(
        color: Colors.white
      ),
      cursorColor: Colors.white,
      controller:  variable,
      decoration: InputDecoration(
         floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint,
        hintStyle: const  TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
        labelText: label,
        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )
      ),
    );
  }

}
