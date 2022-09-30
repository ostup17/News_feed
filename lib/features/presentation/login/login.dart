
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/config.dart';
import 'package:test_work/features/presentation/login/cubit/login_cubit.dart';
import 'package:test_work/features/presentation/login/cubit/login_state.dart';
import 'package:test_work/features/presentation/widgets/app_bar.dart';

import '../widgets/input.dart';

final storage = FlutterSecureStorage();


class Login extends StatelessWidget {
  const Login({super.key});

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

class CubitBuilder extends StatelessWidget {
  const CubitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if(state is LoginLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator()
              ),
            );
          } else if(state is LoginLoaded) {
            return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator()
              ),
            );
          } else if(state is LoginError) {
            return const Scaffold(
              body: Center(
                  child: Text('Erro bad reqr')

              ),
            );
          } else if(state is LoginNotAut) {
            return LoginBody();
          }
          throw StateError('err');
        }
    );
  }
}

class LoginBody extends StatefulWidget {
  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: 'Авторизация',)
      ),
      backgroundColor: ColorConfig.bgHome,
      body: SingleChildScrollView(
        child: Column(
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
                              await context.read<LoginCubit>().auth(login, password);
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
      )
    );
  }
}


