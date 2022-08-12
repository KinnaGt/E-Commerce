import 'package:flutter/material.dart';

import '../utils/theme.dart';

class PasswordForm extends StatefulWidget {
  final void Function(String)? onChanged;
  const PasswordForm({Key? key, this.onChanged}) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}
var invisiblePass = true;

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: (value) {
          if (value == "") {
            return 'Complete el campo';
          } else if (value!.length < 8) {
            return 'Contraseña demasiado corta';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: Color(accent),
          ),
          suffixIcon: GestureDetector(
              child: Icon(
                  invisiblePass ? Icons.visibility : Icons.visibility_off,
                  color: const Color(accent)),
              onTap: () {
                setState(() {
                  invisiblePass = !invisiblePass;
                });
              }),
          filled: true,
          fillColor: const Color(backAccent),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25.7),
          ),
        ),
        obscureText: invisiblePass,
      ),
    );
  }
}