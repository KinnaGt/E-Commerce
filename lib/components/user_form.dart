import 'package:flutter/material.dart';

import '../utils/theme.dart';

class UserForm extends StatelessWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
          validator: (value) {
            if (value == "") {
              return "Complete el campo";
            } else if (value!.length < 4) {
              return "User demasiado corto";
            }
            return null;
          },
          autofocus: false,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.person,
              color: Color(accent),
            ),
            filled: true,
            fillColor: const Color(backAccent),
            hintText: 'User',
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
