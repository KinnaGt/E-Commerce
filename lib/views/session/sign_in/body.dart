import 'package:firebase_auth/firebase_auth.dart';
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

String email = '', password = '', username = '';

class _SignBodyState extends State<SignBody> {
  void validation() async {
    final FormState? _form = _formRegisterKey.currentState;
    if (_form!.validate()) {
      try {
        UserCredential result = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        print(result.user!.uid);
      }catch (e) {
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
                  UserForm(
                    onChanged: (String value) {
                      setState(() {
                        username = value;
                      });
                    },
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
                  RoundedButton(text: 'SIGN IN', press: validation),
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
