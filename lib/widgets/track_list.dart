import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/model/current_track.dart';
import 'package:provider/provider.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;
  const TrackList({
    Key? key,
    required this.tracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      dataRowMaxHeight: 54.0,
      headingTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 12.0),
        columns: [
          DataColumn(label: Text('TITLE')),
          DataColumn(label: Text('ARTIST')),
          DataColumn(label: Text('ALBUM')),
          DataColumn(label: Icon(Icons.access_time_outlined)),
        ],
        rows: tracks.map((e) {
          final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(
              color: selected
                  ? Theme.of(context).hintColor
                  : Theme.of(context).iconTheme.color);
          return DataRow(cells: [
            DataCell(Text(
              e.title,
              style: textStyle,
            )),
            DataCell(Text(
              e.artist,
              style: textStyle,
            )),
            DataCell(Text(
              e.album,
              style: textStyle,
            )),
            DataCell(Text(
              e.duration,
              style: textStyle,
            ))
          ],
          selected: selected,
          onSelectChanged: (_)=>
          context.read<CurrentTrackModel>().selectTrack(e),

          );
        }).toList());
  }
}
