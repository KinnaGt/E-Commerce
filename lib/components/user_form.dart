import 'package:flutter/material.dart';

import '../utils/theme.dart';

class UserForm extends StatelessWidget {
  final void Function(String)? onChanged;
  const UserForm({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
          onChanged: onChanged,
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
