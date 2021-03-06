import 'package:flutter/material.dart';
import 'package:kalpas_internship/models/news.dart';
import 'package:kalpas_internship/screens/sign_up.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignUp(),
      ),
    );
  }
}
