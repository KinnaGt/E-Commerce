import 'package:flutter/material.dart';

import '../utils/strings.dart';
import '../utils/theme.dart';

class EmailForm extends StatelessWidget {
  final void Function(String)? onChanged;
  const EmailForm({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
          onChanged: onChanged,
          validator: (value) {
            if (value == "") {
              return "Complete el campo";
            } else if (!regEmail.hasMatch(value!)) {
              return "Ese mail no es válido";
            }
            return null;
          },
          autofocus: false,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.mail,
              color: Color(accent),
            ),
            filled: true,
            fillColor: const Color(backAccent),
            hintText: 'Email',
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(25.7),
            ),
          ),
        ));
  }
}
