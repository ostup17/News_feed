
import 'package:flutter/material.dart';

import '../config.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
        style: TextStyle(
            color: ColorConfig.textNews,
            fontWeight: FontWeight.w400,
            fontSize: 14),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: ColorConfig.textNews,
            ),
            labelText: 'Поиск',
            // labelStyle: TextStyle(
            //     color: configColors.darkBlue,
            //     fontWeight: FontWeight.w400,
            //     fontFamily: "Mark-Pro"),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius:
              BorderRadius.circular(6),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorConfig.inputLine, width: 1),
            )
        ));
  }
}