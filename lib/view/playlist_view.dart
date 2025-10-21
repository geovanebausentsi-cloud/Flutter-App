import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/app_data.dart';
import 'player_view.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Playlist'),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: AppData.PLAYLIST.length,
          itemBuilder: (context, index) {
            final track = AppData.PLAYLIST[index];
            return Card(
              color: Colors.grey[850],
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: const Icon(Icons.music_note, color: Colors.white),
                title: Text(track.title, style: const TextStyle(color: Colors.white)),
                subtitle: Text(track.artist, style: const TextStyle(color: Colors.grey)),
                trailing: const Icon(Icons.play_arrow, color: Colors.white),
                onTap: () {
                  if (kIsWeb) {
                    _launchURL(track.url);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlayerView(videoId: track.videoId),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
