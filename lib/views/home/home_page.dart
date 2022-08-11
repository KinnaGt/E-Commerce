import 'package:flutter/material.dart';
import '../session/welcome.dart';
import 'body.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: const HomeBody(),
    );
  }

  AppBar _appBar() {
    return AppBar(

      actions: <Widget>[
        TextButton(
          child: const Text('Skip',
              style: TextStyle(fontSize: 18, color: Colors.black)),
          onPressed: _navigateToMain,
        ),
      ],
      elevation: 0,
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
