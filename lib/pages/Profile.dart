import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/realtimebidding/v1.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/users.dart';
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
  late String _nome = "";
  late String _email = "";
  final String _senha = "********";
  late String _telefone = "";
  late String _dataNascimento = "";
  late String _token = '';

  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController dataNascimento = TextEditingController();
  var form = GlobalKey<FormState>();

  getUserData() async {
    // var uid = FirebaseAuth.instance.currentUser!.uid.toString();
    final tokenSave = await SharedPreferences.getInstance();
    String? token = await tokenSave.getString("token");
    _token = token!;
    await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: token)
        .get()
        .then((q) {
      setState(() {
        if (q.docs.isNotEmpty) {
          _nome = q.docs[0].data()['nome'];
          _email = FirebaseAuth.instance.currentUser!.email.toString();
          if (q.docs[0].data()['telefone'] != "") {
            _telefone = q.docs[0].data()['telefone'];
          } else {
            _telefone = "Cadastre um telefone";
          }
          if (q.docs[0].data()['nascimento'] != "") {
            _dataNascimento = q.docs[0].data()['nascimento'];
          } else {
            _dataNascimento = "Cadastre sua data de nascimento";
          }
        } else {
          _nome = "Erro";
        }
      });
    });
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();
    // makeList();
    getUserData();
  }

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
                  controller: (TextEditingController value) =>
                      nome.text = value.text,
                  hint: _nome,
                  password: false,
                ),
                CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  textEditingController: email,
                  label: "E-mail",
                  controller: (TextEditingController value) =>
                      email.text = value.text,
                  hint: _email,
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
                  mask: 1,
                  textInputType: TextInputType.number,
                  textEditingController: telefone,
                  label: "Telefone",
                  controller: (TextEditingController value) =>
                      telefone.text = value.text,
                  hint: _telefone,
                  password: false,
                ),
                CustomTextField(
                  mask: 2,
                  textInputType: TextInputType.number,
                  textEditingController: dataNascimento,
                  label: "Data de Nascimento",
                  controller: (TextEditingController value) =>
                      dataNascimento.text = value.text,
                  hint: _dataNascimento,
                  password: false,
                ),
              ],
            )),
            CustomElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('users').doc(_token).set({
                  'uid': _token,
                  'nome': nome.text.isEmpty ? _nome : nome.text,
                  'nascimento': dataNascimento.text.isEmpty
                      ? _dataNascimento
                      : dataNascimento.text,
                  'telefone': telefone.text.isEmpty ? _telefone : telefone.text,
                });
                setState(() {
                  nome.clear();
                  email.clear();
                  senha.clear();
                  telefone.clear();
                  dataNascimento.clear();
                  getUserData();
                });
                message("Dados atualizados");
              },
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
