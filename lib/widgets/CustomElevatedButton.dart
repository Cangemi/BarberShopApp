import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String? icon;
  final String text;
  final double fontSize;
  final Function onPressed;
  const CustomElevatedButton(
      {Key? key,
      required this.backgroundColor,
      required this.textColor,
      this.icon,
      required this.text,
      required this.fontSize,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(top: 20, bottom: 20))),
        child: SizedBox(
          width: double.infinity,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            icon == null
                ? Container()
                : Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 5),
                    child: Image.asset(
                      icon!,
                      fit: BoxFit.cover,
                    ),
                  ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fontSize,
                  color: textColor,
                  fontWeight: FontWeight.w700),
            )
          ]),
        ));
  }
}
