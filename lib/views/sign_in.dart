import 'package:ecommerce/components/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/email_form.dart';
import '../components/password_form.dart';
import '../components/rounded_button.dart';
import '../components/user_form.dart';
import 'login.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();

class _SignInScreenState extends State<SignInScreen> {
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => {
              FocusManager.instance.primaryFocus?.unfocus(),
              Navigator.pop(context)
            },
          ),
        ),
        body: SafeArea(
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
        ),
      ),
    );
  }

  _navigateToLogin(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen()
      ),
    );
  }

  
}
