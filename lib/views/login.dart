import 'package:ecommerce/views/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/already_have_account.dart';
import '../components/password_form.dart';
import '../components/rounded_button.dart';
import '../components/user_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
//comments


final GlobalKey<FormState> _formLoginKey = GlobalKey<FormState>();
var invisiblePass = true;

class _LoginScreenState extends State<LoginScreen> {
  void validation(){
    final FormState? _form = _formLoginKey.currentState;
    if(_form!.validate()){
      print('VALIDO');
    }else{
      print('Invalido');
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
            title: const Text('Login'),
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
                      const UserForm(),
                      const PasswordForm(),
                      RoundedButton(text: 'Login', press: () => {validation()}),
                      AlreadyHaveAnAccountCheck(
                          press: () => {_navigateToSignIn(context)},
                          login: false),
                    ]),
              ),
            ),
          )),
    );
  }


  
  _navigateToSignIn(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInScreen()
      ),
    );
  }
}