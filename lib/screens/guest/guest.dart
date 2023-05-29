import 'package:flutter/material.dart';
import 'package:flutterproject/screens/guest/auth.dart';
import 'package:flutterproject/screens/guest/password.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widgets = [];
  int _indexSelected = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _widgets.addAll([
      AuthScreen(onChangedStep: (index) => _updateIndexSelected(index)),
      PasswordScreen(
        onChangedStep: (index) => _updateIndexSelected(index),
      ),
    ]);
  }

  void _updateIndexSelected(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
