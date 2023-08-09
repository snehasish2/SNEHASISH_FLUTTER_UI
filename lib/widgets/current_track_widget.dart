import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/model/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(children: [
          TrackInfo(),
          const Spacer(),
          PlayerControls(),
          const Spacer(),
          if(MediaQuery.of(context).size.width >100)MoreControls(),
        ]),
      ),
    );
  }
}

class TrackInfo extends StatelessWidget {
  const TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            )
          ],
        ),
        const SizedBox(width: 12.0,),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
      ],
    );
  }
}

class PlayerControls extends StatelessWidget {
  const PlayerControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.shuffle),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.play_circle_outlined),
              iconSize: 34.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
            ),
            IconButton(
              padding: EdgeInsets.only(),
              onPressed: () {},
              icon: Icon(Icons.repeat),
              iconSize: 20.0,
            )
          ],
        ),
        const SizedBox(
          height: 4.0,
        ),
        Row(
          children: [
            Text(
              '0:00',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(width: 8.0,),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width*0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0,),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        )
      ],
    );
  }
}
class MoreControls extends StatelessWidget {
  const MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.devices_outlined,size: 20.0,)),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.volume_up_outlined,size: 20.0,)),
            Container(height: 5.0,width: 70.0 ,
            decoration: BoxDecoration(color: Colors.grey[800],borderRadius: BorderRadius.circular(2.5)),
            )
          ],
        ),
        IconButton(onPressed: (){}, icon: Icon(Icons.fullscreen_outlined,)),
      ],
    );
  }
}