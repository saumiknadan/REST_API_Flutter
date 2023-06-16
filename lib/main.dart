import 'package:flutter/material.dart';
import 'package:rest_api_flutter/example_five.dart';
import 'package:rest_api_flutter/example_four.dart';
import 'package:rest_api_flutter/example_three.dart';
import 'package:rest_api_flutter/example_two.dart';
import 'package:rest_api_flutter/signup.dart';
import 'home_screen.dart';
import 'upload_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const UploadImage());
  }
}
