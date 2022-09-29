import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/config.dart';
import 'package:test_work/features/presentation/widgets/app_bar.dart';

import '../widgets/input.dart';
class Registration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Manrope'
      ),
      home: RegistrationBody(),
    );
  }
}

class RegistrationBody extends StatelessWidget {
  final TextEditingController _loginEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final TextEditingController _mailEditingController = TextEditingController();

  RegistrationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: 'Регистрация')
      ),
      backgroundColor: ColorConfig.bgHome,
      body: Container(
        margin: const EdgeInsets.only(top: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
                child:  Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      FormInputs(controller: _loginEditingController, hintText: 'Логин'),
                      Container(
                        height: 1,
                        color: ColorConfig.inputLine,
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                      FormInputs(controller: _phoneEditingController, hintText: 'Телефон'),
                      Container(
                        height: 1,
                        color: ColorConfig.inputLine,
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                      FormInputs(controller: _mailEditingController, hintText: 'Почта'),
                      Container(
                        height: 1,
                        color: ColorConfig.inputLine,
                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      ),
                      const RegistrationPasswordInput()
                    ],
                  ),
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 56, horizontal: 16),
              child: Column(
                children: [
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
                          context.go('/');
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



