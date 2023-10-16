import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive/desktop.dart';
import 'package:responsive/mobile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      // home: LayoutBuilder(
      //   builder: (context, constraints) {
      //     print(constraints.minWidth.toInt());
      //
      //     if(constraints.minWidth.toInt()<=600)
      //       return MobileScreen();
      //     return DesktopScreen();
      //   },
      // ),
      // another way to do it

      home: Builder(
        builder: (context) {
          String os=Platform.operatingSystem;
          print(os);
          if (MediaQuery.of(context).size.width <= 600) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1,
            ), child: MobileScreen());
          }
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.25,
              ), child: DesktopScreen());
        },
      ),
    );
  }
}
