import 'package:crudapp/Screen/productscreen.dart';
import 'package:crudapp/Screen/prodductgridviewscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CRUD App',

      home:Productgribview (),
    );
  }

}




