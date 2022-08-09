import 'package:ecommerce/utils/theme.dart';
import 'package:ecommerce/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(                              
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: ThemeData(
          primarySwatch: MaterialColor(background, backgroundSwitch),
          scaffoldBackgroundColor: MaterialColor(background, backgroundSwitch)),
      home: const HomePage(),
    );
  }
}

