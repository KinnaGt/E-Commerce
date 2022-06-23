import 'package:flutter/material.dart';

import '../constants/theme.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Already have an Account ? " : 'Don’t have an Account ? ',
          style:const TextStyle(color: Color(accent)),
        ),
        GestureDetector(
          onTap: () => press(),
          child: Text(
            login ? "Login" : "Sign Up",
            style: const TextStyle(
              color: Color(accent),
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}