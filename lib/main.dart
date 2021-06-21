import 'package:flutter/material.dart';
import 'package:start_hub/screens/projectPage.dart';

import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:ProjectPage(),
    );
  }
}