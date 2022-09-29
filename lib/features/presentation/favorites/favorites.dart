import 'package:flutter/material.dart';

import '../config.dart';
import '../widgets/app_bar.dart';
class Favorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidget(title: 'Избранные')
      ),
      backgroundColor: ColorConfig.bgHome,
      body: Container(
        height: 600,
        margin: const EdgeInsets.symmetric(vertical: 38, horizontal: 16),
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                margin: const EdgeInsets.only(top: 20),
                child: SizedBox(
                    width: 343,
                    child: Column(
                      children: [
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
                                const FavoriteWidgetFromPageFavorites()
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
    );
  }
}


class FavoriteWidgetFromPageFavorites extends StatefulWidget {
  const FavoriteWidgetFromPageFavorites({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteWidgetFromPageFavorites> {
  IconData? _favorite;
  Color? _color;

  @override
  void initState() {
    _favorite = Icons.favorite;
    _color = ColorConfig.red;
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