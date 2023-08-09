import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;
  const PlaylistHeader({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                playlist.imageURL,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                Text(
                  'PLAYLIST',
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontSize: 12.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Created by ${playlist.creator}. ${playlist.songs.length}.${playlist.duration}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
            ]
            )
          )
        ],
        ),
        const SizedBox(
                height: 20.0,
              ),
              PlaylistButtons(followers: playlist.followers),
                      ],
    );
  }
}

class PlaylistButtons extends StatelessWidget {
  final String followers;

  const PlaylistButtons({
    Key? key,
    required this.followers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: (){}, 
          style:TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 48.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            backgroundColor: Theme.of(context).hintColor,
            foregroundColor: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12.0,letterSpacing: 2.0),
          ),
          child: Text(
            'PLAY',
          ),
        ),
        const SizedBox(width:8.0),
        IconButton(onPressed: () {}
        , icon: Icon(Icons.favorite_border,size: 30.0,)),
        const SizedBox(width: 8.0,),
        IconButton(onPressed: () {}
        , icon: Icon(Icons.more_horiz_rounded,size: 30.0,)),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,)
      ],
    );
  }
}
