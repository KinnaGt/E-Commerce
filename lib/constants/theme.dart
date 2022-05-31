import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// ALL THEME VARIABLES 

// COLORS
const int background =  0xFFF1E7DE;
const int accent = 0xFF162039;
const int white = 0xFFF8EEE4;

Map<int, Color> backgroundSwitch =
{
50:const Color.fromRGBO(241, 241, 231, .1),
100:const Color.fromRGBO(241, 241, 231, .2),
200:const Color.fromRGBO(241, 241, 231, .3),
300:const Color.fromRGBO(241, 241, 231, .4),
400:const Color.fromRGBO(241, 241, 231, .5),
500:const Color.fromRGBO(241, 241, 231, .6),
600:const Color.fromRGBO(241, 241, 231, .7),
700:const Color.fromRGBO(241, 241, 231, .8),
800:const Color.fromRGBO(241, 241, 231, .9),
900:const Color.fromRGBO(241, 241, 231, 1),
};
Map<int, Color> accentSwitch =
{
50:const Color.fromRGBO(22, 32, 57, .1),
100:const Color.fromRGBO(22, 32, 57, .2),
200:const Color.fromRGBO(22, 32, 57, .3),
300:const Color.fromRGBO(22, 32, 57, .4),
400:const Color.fromRGBO(22, 32, 57, .5),
500:const Color.fromRGBO(22, 32, 57, .6),
600:const Color.fromRGBO(22, 32, 57, .7),
700:const Color.fromRGBO(22, 32, 57, .8),
800:const Color.fromRGBO(22, 32, 57, .9),
900:const Color.fromRGBO(22, 32, 57, 1),
};
// TEXT STYLES 
TextStyle textH1 = GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 32);
TextStyle textT1 = GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: 24);