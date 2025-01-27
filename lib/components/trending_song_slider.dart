import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_app/config/colors.dart';

class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderItems = [
      Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/images/carousel_img3.jpeg"),
              fit: BoxFit.cover),
          color: divColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: divColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/icons/musical-note-2.png",
                              width: 20,
                              height: 18,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Trending',
                              style: Theme.of(context).textTheme.labelSmall,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DJ WALA BABU',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Badshah',
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: labelColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ];

    return CarouselSlider(
        items: sliderItems,
        options: CarouselOptions(
          height: 260,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 6),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, values) {},
          scrollDirection: Axis.horizontal,
        ));
  }
}
