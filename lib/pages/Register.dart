import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CustomElevatedButton.dart';
import '../widgets/CustomTextField.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;

    return Stack(
      children: [
        Container(
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(41),
              child: Column(
                children: [
                  Text("BarberShop",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pacifico(
                        fontSize: 35,
                        color: yellowAccent,
                        fontStyle: FontStyle.italic,
                      )),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    "Cadastre-se gratuitamente para agendar seu atendimento.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: white,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Form(
                      child: Column(
                    key: form,
                    children: [
                      CustomTextField(
                        textEditingController: nome,
                        label: "Nome",
                        controller: (TextEditingController value) => nome,
                        hint: "José Fernando da Silva",
                        password: false,
                      ),
                      CustomTextField(
                        textEditingController: email,
                        label: "E-mail",
                        controller: (TextEditingController value) => email,
                        hint: "josefernando21@gmail.com",
                        password: false,
                      ),
                      CustomTextField(
                        textEditingController: senha,
                        label: "Senha",
                        controller: (TextEditingController value) => senha,
                        hint: "********",
                        password: true,
                      ),
                    ],
                  )),
                  CustomElevatedButton(
                    onPressed: () {},
                    backgroundColor: yellowAccent,
                    textColor: black,
                    text: "CONFIRMAR CADASTRO",
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        child: Divider(
                          color: white,
                          thickness: 0.8,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "OU",
                          style: TextStyle(color: white),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        child: Divider(
                          color: white,
                          thickness: 0.8,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  CustomElevatedButton(
                    onPressed: () {},
                    icon: "images/googleIcon.png",
                    backgroundColor: white,
                    textColor: black,
                    text: "Cadastre-se com o Google",
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Já tem cadastro? ",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Clique aqui.",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: yellowAccent),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}