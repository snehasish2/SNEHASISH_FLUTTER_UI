import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                  ),
              ),
            ],
          ),
          SideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          SideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox( height: 12.0),
            LibraryPlaylists(),
        ],
      ),
    );
  }
}

class SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(title,
      style: Theme.of(context).textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}
class LibraryPlaylists extends StatefulWidget {
  const LibraryPlaylists({Key? key}) : super(key: key);

  @override
  State<LibraryPlaylists> createState() => _LibraryPlaylistsState();
}

class _LibraryPlaylistsState extends State<LibraryPlaylists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 12.0),
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            children: [
              Padding(
                padding:EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0
                  ),
                  child: Text(
                    'YOUR LIBRARY',
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
              ),
              ...yourLibrary.map((e) => ListTile(
                dense: true,
                title: Text(
                  e,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {}, 
              ))
              .toList(),
            ],
          ),
          const SizedBox(height: 24.0),
          Column(
            children: [
              Padding(
                padding:EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0
                  ),
                  child: Text(
                    'PLAYLISTS',
                    style: Theme.of(context).textTheme.headlineSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
              ),
              ...playlists.map((e) => ListTile(
                dense: true,
                title: Text(
                  e,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {}, 
              ))
              .toList(),
            ],
          ),
        ],
      ),
    );
  }
}