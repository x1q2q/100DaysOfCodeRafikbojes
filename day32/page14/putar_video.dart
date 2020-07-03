import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PutarVideo extends StatefulWidget {
  @override
  _PutarVideoState createState() => _PutarVideoState();
}

class _PutarVideoState extends State<PutarVideo> {
  VideoPlayerController _vidController;
  VideoPlayerController _audController;

  @override
  void initState() {
    super.initState();
    _vidController = VideoPlayerController.network(
        'http://flutter.github.io/asset-for-api-docs/assets/videos/butterfly.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize();
    // ..initialize();
    _audController = VideoPlayerController.network(
        'http://file-examples.com/wp-content/uploads/2017/11/file_example_MP3_700KB.mp3')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text('Putar Online Video')),
        Center(
          child: _vidController.value.initialized
              ? _buildVideoPlayerUI()
              : LinearProgressIndicator(),
        ),
        Divider(height: 10),
        ListTile(title: Text('Putar Online Audio')),
        Center(
          child: _vidController.value.initialized
              ? _buildAudioPlayerUI()
              : LinearProgressIndicator(),
        ),
      ],
    );
  }

  Widget _buildVideoPlayerUI() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: _vidController.value.aspectRatio,
            child: VideoPlayer(_vidController),
          ),
          Text(
              '${_vidController.value.position} - ${_vidController.value.duration}'),
          VideoProgressIndicator(_vidController, allowScrubbing: true),
          RaisedButton.icon(
              onPressed: () => _vidController.value.isPlaying
                  ? _vidController.pause()
                  : _vidController.play(),
              icon: Icon(_vidController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow),
              label: Text(_vidController.value.isPlaying ? 'Pause' : 'Play'))
        ]);
  }

  Widget _buildAudioPlayerUI() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          VideoProgressIndicator(_audController, allowScrubbing: true),
          Text(
              '${_audController.value.position} - ${_audController.value.duration}'),
          RaisedButton.icon(
              onPressed: () => _audController.value.isPlaying
                  ? _audController.pause()
                  : _audController.play(),
              icon: Icon(_audController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow),
              label: Text(_audController.value.isPlaying ? 'Pause' : 'Play'))
        ]);
  }

  @override
  void dispose() {
    _vidController.dispose();
    super.dispose();
  }
}
