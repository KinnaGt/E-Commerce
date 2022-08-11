import 'package:ecommerce/components/already_have_account.dart';
import 'package:ecommerce/views/session/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../components/rounded_button.dart';
import '../../utils/strings.dart';
import '../../utils/theme.dart';
import 'login/login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
            RoundedButton(
                text: 'SIGN IN', press: () => _navigateToSignIn(context)),
            AlreadyHaveAnAccountCheck(
              press: () => _navigateToLogin(context),
            ),
          ],
        ),
      ),
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
