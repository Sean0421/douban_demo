
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shoppingMall/core/extension/int_extension.dart';

// ignore: must_be_immutable
class SHFlutterSwiper extends StatelessWidget {
  List<String> list = [
    'https://s10.mogucdn.com/mlcdn/c45406/180926_45fkj8ifdj4l824l42dgf9hd0h495_750x390.jpg',
    'https://s10.mogucdn.com/mlcdn/c45406/180926_31eb9h75jc217k7iej24i2dd0jba3_750x390.jpg',
    'https://s10.mogucdn.com/mlcdn/c45406/180919_3f62ijgkj656k2lj03dh0di4iflea_750x390.jpg',
    'https://s10.mogucdn.com/mlcdn/c45406/180917_18l981g6clk33fbl3833ja357aaa0_750x390.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.px,
      child: Swiper(
        plugins: [
          // SwiperControl(),
          SwiperPagination()
        ],
        loop: true,
        itemCount: 4,
        autoplay: true,
        scrollDirection: Axis.horizontal,
        itemHeight: 200.px,
        itemWidth: double.infinity,
        itemBuilder: (context, index){
          return Image.network(list[index], fit: BoxFit.cover,);
        },
      ),
    );
  }
}
