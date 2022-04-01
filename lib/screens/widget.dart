import 'package:flutter/material.dart';
import 'package:youtube_bloc/models/video_model.dart';

class VideTile extends StatelessWidget {
  const VideTile({Key? key, required this.video}) : super(key: key);
  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            video.thumb,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                      child: Text(
                        video.title,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                      child: Text(
                        video.channel,
                        style:
                            const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    )
                  ]),
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_outline,
                  color: Colors.white,
                ))
          ],
        )
      ]),
    );
  }
}
