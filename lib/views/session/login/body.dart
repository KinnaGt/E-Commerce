import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/already_have_account.dart';
import '../../../components/email_form.dart';
import '../../../components/password_form.dart';
import '../../../components/rounded_button.dart';
import '../sign_in/sign_in.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
var invisiblePass = true;
String email = '', password = '';

class _LoginBodyState extends State<LoginBody> {
  Future<void> validation() async {
    final FormState? _form = _formLoginKey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Logueado Exitosamente'),
        ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString().split(']')[1]),
        ));
      }
    } else {
      print('INVALIDO');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Form(
        key: _formLoginKey,
        child: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15.0),
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height / 2 - 50,
                  child: SvgPicture.asset(
                    'assets/images/mansplaining.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                EmailForm(
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
                PasswordForm(
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
                RoundedButton(text: 'Login', press: () => {validation()}),
                AlreadyHaveAnAccountCheck(
                    press: () => {_navigateToSignIn(context)}, login: false),
              ]),
        ),
      ),
    );
  }

  _navigateToSignIn(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }
}
