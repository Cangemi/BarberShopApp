import 'package:flutter/material.dart';

import '../widgets/CustomElevatedButton.dart';
import '../widgets/CustomTextField.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Color yellowAccent = Colors.yellowAccent;
  Color black = Colors.black87;
  Color yellow = Colors.yellow;
  Color white = Colors.white;
  final String _nome = "José Fernando da Silva";
  final String _email = "josefernando@gmail.com";
  final String _senha = "********";
  final String _telefone = "16997520000";
  final String _dataNascimento = "27041994";

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  var form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double height = size.height;
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(right: 41, left: 41, bottom: 41, top: 20),
        child: Column(
          children: [
            Text(
              "Olá, $_nome!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: yellowAccent,
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
                  controller: (TextEditingController value) => nome = value,
                  hint: _nome,
                  password: false,
                ),
                CustomTextField(
                  textEditingController: email,
                  label: "E-mail",
                  controller: (TextEditingController value) => email = value,
                  hint: "josefernando21@gmail.com",
                  password: false,
                ),
                CustomTextField(
                  textEditingController: senha,
                  label: "Senha",
                  controller: (TextEditingController value) => senha = value,
                  hint: "********",
                  password: true,
                ),
                CustomTextField(
                  textEditingController: telefone,
                  label: "Telefone",
                  controller: (TextEditingController value) => telefone = value,
                  hint: _telefone,
                  password: false,
                ),
                CustomTextField(
                  textEditingController: dataNascimento,
                  label: "Data de Nascimento",
                  controller: (TextEditingController value) =>
                      dataNascimento = value,
                  hint: _dataNascimento,
                  password: false,
                ),
              ],
            )),
            CustomElevatedButton(
              onPressed: () {},
              backgroundColor: yellowAccent,
              textColor: black,
              text: "ATUALIZAR MEUS DADOS",
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
