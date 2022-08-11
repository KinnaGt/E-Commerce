import 'package:ecommerce/views/session/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/strings.dart';
import '../../utils/theme.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
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
                onPressed: () =>_navigateToMain(context))),
      ]);
  }
  _navigateToMain(BuildContext context) {
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