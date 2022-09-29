import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_work/features/presentation/config.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: 700,
        child: Column(
          children: [
            SizedBox(
                height: 275,
                child:  Stack(
                  children: [
                    Image.network('https://cdn.kino.kz/cinema/99/g800x534_10.jpg', fit: BoxFit.fill,),
                    Container(
                      margin: const EdgeInsets.only(top: 54),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            context.go('/home');
                          }, icon: const Icon(Icons.chevron_left, color: Colors.white, size: 30,)
                          ),
                          Text('Asia Mall', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),),
                          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border,  color: Colors.white, size: 30,))
                        ],
                      )
                    )
                  ],
                )
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('opisanit', style: TextStyle(color: ColorConfig.textNews, fontSize: 13, fontWeight: FontWeight.w400),),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 3, 0, 5),
                    width: 343,
                    height: 84,
                    child: Text(
                          'Очень прого супер пупер длииного не длэыэваьд эыдваьОчень прого супер пупер длииного не длэыэваьд эыдваьОчень прого супер пупер длииного не длэыэваьд эыдваьОчень прого супер пупер длииного не длэыэваьд эыдваь',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.w400, color: ColorConfig.black, fontSize: 16),
                    )

                  ),
                  InkWell(
                    onTap: () {},
                    child: Text('Подробнее', style: TextStyle(color: ColorConfig.buttonHome, decoration: TextDecoration.underline),),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 19),
                    height: 1,
                    color: ColorConfig.inputLine,
                  ),
                  const WidgetDetails(pathToIcon: 'assets/images/time.png', desc: 'Работает с 20:00 до 6:00'),
                  SizedBox(
                    height: 14,
                  ),
                  const WidgetDetails(pathToIcon: 'assets/images/geo.png', desc: 'Шымкент и Бишкек'),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 19),
                    height: 1,
                    color: ColorConfig.inputLine,
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

class WidgetDetails extends StatelessWidget {
  final String pathToIcon;
  final String desc;
  const WidgetDetails({required this.pathToIcon, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(pathToIcon),
          color: Colors.black,
        ),
        Container(
            margin: const EdgeInsets.only(left: 12),
            child: Text(desc, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),)
        )
      ],
    );
  }
}