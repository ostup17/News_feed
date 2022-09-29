import 'package:flutter/material.dart';

import '../config.dart';

class FormInputs extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  const FormInputs({super.key,
    required this.controller,
    required this.hintText
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorConfig.inputText,)
        ),
      ),
    );
  }
}



class RegistrationPasswordInput extends StatefulWidget{
  const RegistrationPasswordInput({super.key});

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<RegistrationPasswordInput> {
  final TextEditingController _passwordEditingController = TextEditingController();

  late bool _passwordVisible;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      child: TextFormField(
        controller: _passwordEditingController,
        obscureText: !_passwordVisible,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Пароль',
            hintStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: ColorConfig.inputText,),
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: ColorConfig.black,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )
        ),
      ),
    );
  }
}