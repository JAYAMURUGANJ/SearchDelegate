import 'package:flutter/material.dart';

import 'HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SearchDelegate',
      debugShowCheckedModeBanner: false,
      //cutomize the theme of the app
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        //customize the app bar
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData.fallback(),
          color: Color.fromARGB(255, 215, 217, 219),
          toolbarTextStyle: TextTheme(
            subtitle1: TextStyle(
              color: Color.fromARGB(255, 29, 27, 27),
              fontSize: 20,
            ),
          ).bodyText2,
          titleTextStyle: TextTheme(
            subtitle2: TextStyle(
              color: Color.fromARGB(255, 48, 47, 47),
              fontSize: 20,
            ),
          ).headline6,
        ),
      ),

      home: HomePage(),
    );
  }
}
