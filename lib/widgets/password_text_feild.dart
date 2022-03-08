import 'package:flutter/material.dart';

class PasswordTextFeild extends StatefulWidget {
  const PasswordTextFeild({Key? key}) : super(key: key);

  @override
  _PasswordTextFeildState createState() => _PasswordTextFeildState();
}

class _PasswordTextFeildState extends State<PasswordTextFeild> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child:  Text( obscureText ? 'Show' : 'Hide',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary
          ),
          ) ,
        ),
      ),
    );
  }
}
