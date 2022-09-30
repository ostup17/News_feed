import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/login/cubit/login_cubit.dart';
import 'package:test_work/features/presentation/login/login.dart';

import 'features/presentation/Home/bottom_app_bar.dart';
import 'features/presentation/registration/registration.dart';

void main() async{
  runApp(BlocProvider<LoginCubit>(
    create: (context) => LoginCubit(),
    child: App(),
  ));
}
class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(

    debugShowCheckedModeBanner: false,
    routeInformationParser: _router.routeInformationParser,
    routerDelegate: _router.routerDelegate,
    routeInformationProvider: _router.routeInformationProvider,
  );

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => Login() ,
      ),
      GoRoute(
        path: '/registration',
        builder: (BuildContext context, GoRouterState state) => Registration() ,
      ),
      GoRoute(
        path: '/home',
        builder: (BuildContext context, GoRouterState state) => const News() ,
      ),
    ],
  );
}