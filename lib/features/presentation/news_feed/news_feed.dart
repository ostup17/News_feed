
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_work/features/data/auth_model.dart';
import 'package:test_work/features/presentation/login/cubit/login_cubit.dart';
import 'package:test_work/features/presentation/login/cubit/login_state.dart';
import 'package:test_work/features/presentation/widgets/search_bar.dart';

import '../widgets/favorite.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if(state is LoginLoaded) {
            log(state.authModel.user.email);
            return Container(
              margin: const EdgeInsets.fromLTRB(16, 64, 16, 0),
              child: Column(
                children: [
                  Expanded(
                      child: SearchBar()
                  ),
                  Container(
                    height: 600,
                    margin: const EdgeInsets.only(top: 20),
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                                width: 343,
                                child: Column(
                                  children: [
                                    Text('${state.authModel.user.email}'),
                                    SizedBox(
                                        width: 343,
                                        height: 150,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(6),
                                            child: Image.network('https://cdn.kino.kz/cinema/99/g800x534_10.jpg', fit: BoxFit.fill,)

                                        )
                                    ),
                                    Container(
                                      width: 343,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(6),
                                              bottomLeft: Radius.circular(6)
                                          )
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 11, 0, 1),
                                                  child: Text('Text test', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                                                ),
                                                const SizedBox(
                                                  width: 258,
                                                  // child:  Flexible(
                                                  child: Text('Много, очень много непонятного для меня текста',
                                                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                  // )
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.fromLTRB(0, 2, 0, 12),
                                                  child:  const Text('Text test', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),),
                                                )
                                              ],
                                            ),
                                            const Favorite()
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )
                            )
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          throw StateError('message');
        }
    );
  }
}