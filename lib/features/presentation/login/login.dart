import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/config.dart';
import 'package:test_work/features/presentation/widgets/app_bar.dart';

import '../widgets/button.dart';
import '../widgets/input.dart';
class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Manrope'
      ),
      home: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  LoginBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: 'Авторизация',)
      ),
      backgroundColor: ColorConfig.bgHome,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 123,
          ),
          Form(
            child:  Container(
              color: Colors.white,
              child: Column(
                children: [
                  FormInputs(controller: _loginEditingController, hintText: 'Логин или почта'),
                  Container(
                    height: 1,
                    color: ColorConfig.inputLine,
                    margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                  FormInputs(controller: _passwordEditingController, hintText: 'Пароль'),
                ],
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 32, 0, 19),
                  child: const AuthButton(navigationScreen: '/test', title: 'Войти',),
                ),
                 const AuthButton(navigationScreen: '/registration', title: 'Зарегистрироваться',),
              ],
            ),
          )
        ],
      ),
    );
  }
}


