import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        // SafeArea permet d'avoir un espace au top
        child: Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ), //Permet de créer la topBar
      body: Container(
          child: Center(
        child: Text('coucou sdlkajsdklj '),
      )),
    ));
  }
}
