import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/already_have_account.dart';
import '../../../components/email_form.dart';
import '../../../components/password_form.dart';
import '../../../components/rounded_button.dart';
import '../../../components/user_form.dart';
import '../login/login.dart';

class SignBody extends StatefulWidget {
  const SignBody({Key? key}) : super(key: key);

  @override
  State<SignBody> createState() => _SignBodyState();
}

final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

class _SignBodyState extends State<SignBody> {
  void validation() {
    final FormState? _form = _formRegisterKey.currentState;
    if (_form!.validate()) {
      print('VALIDADO');
    } else {
      print('INVALIDO');
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Form(
        key: _formRegisterKey,
        child: Center(
          child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(15.0),
              children: [
                SizedBox(
                  width: double.infinity,
                  height: height / 2 - 100,
                  child: SvgPicture.asset(
                    'assets/images/ideas.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                const UserForm(),
                const EmailForm(),
                const PasswordForm(),
                RoundedButton(text: 'SIGN IN', press: () => {validation()}),
                AlreadyHaveAnAccountCheck(
                    press: () => _navigateToLogin(context)),
              ]),
        ),
      ),
    );
  }

  _navigateToLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }
}
