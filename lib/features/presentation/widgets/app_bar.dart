import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.white,
        ),
        automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Text(title, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
      centerTitle: true,
    );
  }
}