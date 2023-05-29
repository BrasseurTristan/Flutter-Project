import 'package:flutter/material.dart';
import 'package:flutterproject/screens/guest/guest.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GuestScreen(),
    );
  }
}
