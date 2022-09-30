
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_work/features/presentation/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/auth_model.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginNotAut());

  Future<void> auth(String login, String password) async {
    emit(LoginLoading());
    const String apiUrl = 'http://188.225.83.80:6719/api/v1/auth/login';

    final response = await http.post(Uri.parse(apiUrl), body: {
      "email": login,
      "password": password
    });

    if(response.statusCode == 200) {
      final responseJson = json.decode(response.body) as Map<String, dynamic>;
      print(responseJson);
      emit(LoginLoaded(authModel: AuthModel.fromJson(responseJson)));

    } else {
      print(response.statusCode);
      emit(LoginError());
    }
  }
}


