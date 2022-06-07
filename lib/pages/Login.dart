import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/CustomElevatedButton.dart';
import '../widgets/CustomTextField.dart';
import 'Register.dart';
import 'Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  final String _email = "email@email.com";
  final String _senha = "123456";

  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  var form = GlobalKey<FormState>();

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
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(
                  //   height: height * 0.01,
                  // ),
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
                    "Para realizar o agendamento é preciso estar logado.",
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
                        textInputType: TextInputType.emailAddress,
                        textEditingController: email,
                        label: "E-mail",
                        controller: (TextEditingController value) =>
                            email = value,
                        hint: _email,
                        password: false,
                      ),
                      CustomTextField(
                        textEditingController: senha,
                        label: "Senha",
                        controller: (TextEditingController value) =>
                            senha = value,
                        hint: "********",
                        password: true,
                      ),
                    ],
                  )),
                  CustomElevatedButton(
                    onPressed: () {
                      if (email.text.isNotEmpty && senha.text.isNotEmpty) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email.text, password: senha.text)
                            .then((res) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()));
                          print("Login Ok");
                        }).catchError((e) {
                          //print("Login incorreto" + e.code.toString());
                          switch (e.code) {
                            case 'invalid-email':
                              message("O formato do email é inválido");
                              break;
                            case 'user-not-found':
                              message("Usuário não encontrado");
                              break;
                            case 'wrong-password':
                              message("Senha ou Email incorretos");
                              break;
                            default:
                              message(e.code.toString());
                          }
                        });
                      } else {
                        message("Preencha todos os campos");
                      }
                    },
                    backgroundColor: yellowAccent,
                    textColor: black,
                    text: "Entrar",
                    fontSize: 16,
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
                    text: "Entrar com o Google",
                    fontSize: 14,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Text(
                    "Não tem cadastro?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: white),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Register()));
                      },
                      child: Text(
                        "Clique aqui e cadastre-se!",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: yellowAccent),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
