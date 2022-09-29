import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config.dart';

class AuthButton extends StatelessWidget {
  final String navigationScreen;
  final String title;
  const AuthButton({super.key,
    required this.navigationScreen,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              context.go(navigationScreen);
            },
            child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: 16),)
        )
    );
  }
}