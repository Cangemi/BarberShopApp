import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.yellowAccent, width: 2)),
      backgroundColor: Colors.black,
      title: const Text(
        "Sobre",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.yellowAccent),
      ),
      content: SizedBox(
        height: 300,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          const Text(
            "Este aplicativo tem o intuito de realizar agendamento de horários para barbearias. Ele possibilita o estabelecimento ter controle dos agendamentos através do Google Calendar.",
            style: TextStyle(color: Colors.white),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, right: 10),
                child: Image.asset(
                  "images/aluno.jpg",
                  scale: 2,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.32,
                child: const Text("Desenvolvedor: Pedro Cangemi",
                    style: TextStyle(color: Colors.white)),
              )
            ],
          )
        ]),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Fechar",
              style: TextStyle(color: Colors.yellowAccent),
            ))
      ],
    );
  }
}
