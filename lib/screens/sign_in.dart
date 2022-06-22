import 'package:ecommerce/components/already_have_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/rounded_button.dart';
import '../constants/theme.dart';
import 'login.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: Center(
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
              const Spacer(),
              RoundedButton(text: 'SIGN IN', press: () => {}),
              AlreadyHaveAnAccountCheck(press: () => _navigateToLogin(context)),
              const Spacer()
            ]),
      ),
    );
  }

  _navigateToLogin(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginScreen();
        },
      ),
    );
  }

  Widget _userForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
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
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: Color(accent),
          ),
          suffixIcon: const Icon(
            Icons.visibility,
            color: Color(accent),
          ),
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
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter your password';
          }
          return null;
        },
      ),
    );
  }

  Widget _emailForm() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: TextFormField(
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
