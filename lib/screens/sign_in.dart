import 'package:ecommerce/components/already_have_account.dart';
import 'package:ecommerce/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/rounded_button.dart';
import '../constants/theme.dart';
import 'login.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final GlobalKey<FormState> _formRegisterKey = GlobalKey<FormState>();
var invisiblePass = true;

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
                    _userForm(),
                    _emailForm(),
                    _passwordForm(),
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

  Widget _emailForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
          validator: (value) {
            if (value == "") {
              return "Complete el campo";
            } else if (!regEmail.hasMatch(value!)) {
              return "Ese mail no es válido";
            }
            return null;
          },
          autofocus: false,
          decoration: InputDecoration(
            icon: const Icon(
              Icons.mail,
              color: Color(accent),
            ),
            filled: true,
            fillColor: const Color(backAccent),
            hintText: 'Email',
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
