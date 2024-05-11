import 'package:flutter/material.dart';
import 'package:json_testing/pages/create_sending/Create_sending_data.dart';
import 'package:json_testing/pages/delete_data/delete_data.dart';
import 'package:json_testing/pages/fetch_data/fatch_data.dart';
import 'package:json_testing/pages/home/home_page.dart';
import 'package:json_testing/pages/update/update_data.dart';
import 'package:json_testing/pages/websocket/websocket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
          primaryColor: Colors.cyanAccent[300],
          iconTheme: IconThemeData(color: Colors.green),
          textTheme: TextTheme(
              bodySmall: TextStyle(backgroundColor: Colors.amber, color: Colors.amber))),
      routes: {
        '/': (context) => HomePage(),
        "/FetchData": (context) => FetchData(),
        "/CreateData": (context) => CreateData(),
        "/DeleteData": (context) => DeleteData(),
        "/UpdateData": (context) => UpdateData(),
        "/WebSocket": (context) => WebSocket(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
