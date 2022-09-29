import 'package:flutter/material.dart';

import '../config.dart';
import '../widgets/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: 'Профиль')
      ),
      backgroundColor: ColorConfig.bgHome,
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(90, 38, 90, 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 64,
                  height: 64,
                  child: Image.asset('assets/images/profileInProfilePage.png', fit: BoxFit.fill,)
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15),
                  child: const Text('Остапенко Даниил', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text('example1238@mail.com', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: ColorConfig.textNews),),
                )
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 55,
            width: double.infinity,
            child: Align(
              alignment: const Alignment(-0.9, 0.0),
              child: Text('Выйти', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: ColorConfig.red),),
            )
          )
        ],
      ),
    );
  }
}