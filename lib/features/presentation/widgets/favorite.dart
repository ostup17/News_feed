import 'package:flutter/material.dart';
import 'package:test_work/features/presentation/config.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  IconData? _favorite;
  Color? _color;

  @override
  void initState() {
    _favorite = Icons.favorite_border;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (_favorite == Icons.favorite_border) {
            _favorite = Icons.favorite;
            _color = ColorConfig.red;
          } else {
            _favorite = Icons.favorite_border;
            _color = ColorConfig.black;
          }
          setState(() {});
        },
        icon: Icon(
          _favorite,
          color: _color,
          size: 27,
        ));
  }
}