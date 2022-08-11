import 'package:ecommerce/views/session/sign_in/body.dart';
import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: const SignBody(),
      )
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
        title: const Text('Sign In'),
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
