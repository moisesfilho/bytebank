import 'package:bytebank/screens/tranferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListaTranferencias(),
      theme: ThemeData(
        primaryColor: Colors.grey[700],
        accentColor: Colors.indigoAccent[700],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.indigoAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
