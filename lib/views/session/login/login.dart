import 'package:flutter/material.dart';

import 'body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(appBar: _appBar(context), body: const LoginBody()));
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Login'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => {
          FocusManager.instance.primaryFocus?.unfocus(),
          Navigator.pop(context)
        },
      ),
    );
  }
}
