import 'package:ecommerce/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/already_have_account.dart';
import '../components/rounded_button.dart';
import '../constants/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

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
                      _userForm(),
                      _passwordForm(),
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

  Widget _userForm() {
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

  Widget _passwordForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: TextFormField(
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

  _navigateToSignIn(context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInScreen()
      ),
    );
  }
}
