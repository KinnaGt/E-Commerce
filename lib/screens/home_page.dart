import 'package:ecommerce/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/strings.dart';
import '../constants/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => {},
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Skip',
                style: TextStyle(fontSize: 18, color: Colors.black)),
            onPressed: _navigateToMain,
          ),
        ],
        elevation: 0,
      ),
      body: Column(children: [
        Text(
          presentationTitleStr,
          style: textH1,
        ),
        SizedBox(
            width: double.infinity,
            height: height / 2 - 50,
            child: SvgPicture.asset(
              'assets/images/main_screen.svg',
              fit: BoxFit.scaleDown,
            )),
        SizedBox(
          height: height / 12,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Text(
            presentationDescStr,
            style: textT1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              color: Color(accent),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: IconButton(
                icon: const Icon(Icons.arrow_forward, color: Color(background)),
                onPressed: _navigateToMain)),
      ]),
    );
  }
  
  _navigateToMain() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const WelcomeScreen();
        },
      ),
    );
  }
}
