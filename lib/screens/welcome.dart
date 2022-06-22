import 'package:ecommerce/components/already_have_account.dart';
import 'package:ecommerce/screens/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/rounded_button.dart';
import '../constants/strings.dart';
import '../constants/theme.dart';
import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        
        title: const Text('WELCOME'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {Navigator.pop(context)},
        ),
      ),
      body: Column(
        children: [
         SizedBox(
            width: double.infinity,
            height: height / 2 - 50,
            child: SvgPicture.asset(
              'assets/images/welcome.svg',
              fit: BoxFit.scaleDown,
            )),
          Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Text(
              loginScreenStr,
              style: textT1,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          RoundedButton(text: 'SIGN IN',press: () => _navigateToSignIn(context)),
          AlreadyHaveAnAccountCheck(press: () => _navigateToLogin(context),),
          const Spacer()
        ],
      )
    );
    
  }
  _navigateToSignIn(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignInScreen();
        },
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

  
}
