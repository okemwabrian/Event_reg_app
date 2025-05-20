import 'package:event_regstration_app_project/home_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(EventRegistrationApp());
}

class EventRegistrationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Registration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
