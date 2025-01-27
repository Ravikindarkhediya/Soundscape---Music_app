import 'package:flutter/material.dart';
import 'package:music_app/config/colors.dart';

class SongTile extends StatelessWidget {
  final String songName;
  final VoidCallback onTap;
  const SongTile({super.key, required this.songName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          // margin: const EdgeInsets.only(bottom: 10),
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
              Expanded(
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  songName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
