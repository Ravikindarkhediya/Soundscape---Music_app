import 'package:flutter/material.dart';

class SongHeader extends StatelessWidget {
  const SongHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/splash_logo_150.png", width: 50),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Soundscape',
          style: TextStyle(
              fontSize: 27, fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
