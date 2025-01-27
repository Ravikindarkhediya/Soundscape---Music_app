import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/config/colors.dart';

class PlaySongHeaderButton extends StatelessWidget {
  const PlaySongHeaderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: divColor, borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Icon(Icons.arrow_back_ios_new),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Container(
            width: 40, height: 40,
            // padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: divColor, borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Icon(Icons.settings),
            ),
          ),
        )
      ],
    );
  }
}
