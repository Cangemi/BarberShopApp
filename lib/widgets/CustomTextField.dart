import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Function controller;
  final String label;
  final String hint;
  final bool password;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.hint,
      required this.password,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TextEditingController textEditingController = TextEditingController();
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 20),
          decoration: const BoxDecoration(color: Color(0xFF181818)),
          child: TextFormField(
            onTap: () {
              controller(textEditingController);
            },
            obscureText: password,
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            controller: textEditingController,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 10, top: 0, bottom: 0),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: hint,
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w100,
                color: Colors.white70,
              ),
              enabledBorder: const UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 179, 165, 42))),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellowAccent)),
            ),
          ),
        )
      ],
    );
  }
}
