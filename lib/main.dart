import 'package:currencyconvt/currency_convertor_materialdesign_app.dart';
import 'package:flutter/material.dart'; // this is for the android widgets
import 'package:flutter/cupertino.dart'; // this is for the cupertino apple widgets

void main() {
  runApp(
    const MyApp(),
  ); //just pass MyApp class in this to directly run the app here
  //types of widgets
  //Stateless widget- in this the data is immutable it means once the data is defined it can not be changed(it is immutable)
  //statefulWidget- it is mutable widget it can change
  //InheritedWidget
}
//there are two types of designs we need to follow to design the app
//1.Material App- which is designed by google
//2.Cupertino App- which is designed by Apple for different type of layout

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // we have to pass a constructor in this

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:
          CurrencyConvertorMaterial(), // if we check the top of the code we see that it import the currencyconvert.dart file in the main.dart file
    ); // here we need to override the built function of the Stateless widget when we try to hover the cursor to the stateless widget and click ctrl+click then we reach the directory of the stateless widget
  }
}
