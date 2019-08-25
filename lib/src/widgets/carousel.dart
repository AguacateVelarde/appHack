import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<Widget> child;
  CardSwiper(this.child);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 16.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.5,
        itemHeight: _screenSize.height * 0.3,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: child[index]
              );
        },
        itemCount: 3,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
