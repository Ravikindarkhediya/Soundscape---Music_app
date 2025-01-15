import 'package:flutter/material.dart';
import 'package:music_app/config/colors.dart';

class SongTile extends StatelessWidget {
  const SongTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: divColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(Icons.play_arrow_rounded),
          const SizedBox(
            width: 10,
          ),
          Text(
            'first song of my playlist',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
