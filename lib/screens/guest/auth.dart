import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  final Function(int)? onChangedStep;
  const AuthScreen({super.key, this.onChangedStep});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RegExp emailRegex = RegExp(r'[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+');
  String? _mail;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Plus besoin d\'y penser,'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                  ),
                  children: [
                    TextSpan(
                      text: ' on le fait pour '.toUpperCase(),
                    ),
                    TextSpan(
                      text: ' vous'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Enter your email'),
                      TextFormField(
                        onChanged: (value) => setState(() => _mail = value),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Ex: john.doe@domain.ltd',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed:
                            (_mail != null && !emailRegex.hasMatch(_mail!))
                                ? null
                                : () {
                                    if (_formKey.currentState != null &&
                                        _formKey.currentState!.validate()) {
                                      print(_mail);
                                      if (widget.onChangedStep != null) {
                                        widget.onChangedStep!(1);
                                      }
                                    }
                                  },
                        child: Text(
                          'continue'.toUpperCase(),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
