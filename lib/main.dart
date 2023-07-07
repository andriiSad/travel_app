import 'package:flutter/material.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
