import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/config.dart';
import 'package:test_work/features/presentation/widgets/app_bar.dart';

import '../../data/auth_model.dart';
import '../widgets/input.dart';
import 'package:http/http.dart' as http;
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

Future<AuthModel?> auth(String login, String password) async {
  final String apiUrl = 'http://188.225.83.80:6719/api/v1/auth/login';

  final response = await http.post(Uri.parse(apiUrl), body: {
    "email": login,
    "password": password
  });

  if(response.statusCode == 200) {
    final String responseString = response.body;

    return authModelFromJson(responseString);
  } else {
    return null;
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  AuthModel? _auth;

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
                  child: SizedBox(
                      width: 343,
                      height: 64,
                      child:  ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(ColorConfig.buttonHome),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  )
                              )
                          ),
                          onPressed: () async {
                            final login = _loginEditingController.text;
                            final password = _passwordEditingController.text;

                            final AuthModel? authentificate = await auth(login, password);

                            setState(() {
                              _auth = authentificate;
                            });
                            context.go('/home');
                          },
                          child: const Text('Войти', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 16),)
                      )
                  ),
                ),
                SizedBox(
                    width: 343,
                    height: 64,
                    child:  ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(ColorConfig.buttonHome),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                )
                            )
                        ),
                        onPressed: () {
                          context.go('/registration');
                        },
                        child: const Text('Зарегистрироваться', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 16),)
                    )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


