import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color yellowAccent = Colors.yellowAccent;

    List<String> list = [
      "https://images.pexels.com/photos/1804638/pexels-photo-1804638.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/10024234/pexels-photo-10024234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/7697394/pexels-photo-7697394.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/3998404/pexels-photo-3998404.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940flutter",
      "https://images.pexels.com/photos/1804638/pexels-photo-1804638.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/10024234/pexels-photo-10024234.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/7697394/pexels-photo-7697394.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/3998404/pexels-photo-3998404.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940flutter",
      "https://images.pexels.com/photos/1804638/pexels-photo-1804638.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "https://images.pexels.com/photos/1804638/pexels-photo-1804638.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    ];

    List<Widget> tile = [];

    var random = Random();
    int x = 0;
    int y = 0;
    int count = 0;

    col(int x) {
      if (x == 3) {
        y = 2 + random.nextInt(4 - 2);
        count = y;
      } else if (x == 1) {
        y = 1;
      } else if (x == 2) {
        y = 2;
      } else {
        y = 4;
      }
    }

    for (var i = 0; i < list.length; i++) {
      if (count == 0) {
        if (i % 2 != 0) {
          x = 2 + random.nextInt(4 - 2);
          col(x);
        } else {
          x = 4 - x;
          col(x);
        }
      } else {
        x = 1;
        y = 1;
        count--;
      }
      tile.add(StaggeredGridTile.count(
        crossAxisCellCount: x,
        mainAxisCellCount: y,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(list[i]), fit: BoxFit.cover),
          ),
        ),
      ));
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: Center(
            child: Column(
          children: [
            Text(
              "Conheça nossos serviços!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: yellowAccent,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            StaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: tile,
            )
          ],
        )),
      ),
    );
  }
}
