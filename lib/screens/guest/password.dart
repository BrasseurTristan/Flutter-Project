import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final Function(int)? onChangedStep;
  const PasswordScreen({super.key, this.onChangedStep});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool _isSecret = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0.0,
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () => widget.onChangedStep!(0),
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              children: [
                Text(
                  'Lorem ipsus mordem'.toUpperCase(),
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(height: 50.0),
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Enter your password'),
                        TextFormField(
                          onChanged: (value) =>
                              setState(() => _password = value),
                          validator: (value) => (value?.length ?? 0) < 6
                              ? 'Enter a passwords. 6 caracters min required.'
                              : null,
                          obscureText: _isSecret,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () =>
                                  setState(() => _isSecret = !_isSecret),
                              child: Icon(
                                !_isSecret
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.red,
                              ),
                            ),
                            hintText: '*************',
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
                          onPressed: (_password?.length ?? 0) < 6
                              ? null
                              : () {
                                  if (_formKey.currentState != null &&
                                      _formKey.currentState!.validate()) {
                                    print(_password);
                                    if (widget.onChangedStep != null) {
                                      widget.onChangedStep!(0);
                                    }
                                  }
                                  ;
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
      ),
    );
  }
}
