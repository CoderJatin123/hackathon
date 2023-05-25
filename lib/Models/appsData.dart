import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class App{
  String name="";
  // ignore: prefer_const_constructors
  Icon icon= Icon(FontAwesomeIcons.speakerDeck);
  
  App(this.name,this.icon);
}