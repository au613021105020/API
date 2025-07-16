import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoPlayerScreen(),
  ));
}

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/Assets-for-api-docs/Assets/videos/bee.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildIcon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("Video Player Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.value.isInitialized
                  ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
                  : CircularProgressIndicator(),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: Text(
                  _controller.value.isPlaying ? "Pause" : "Play",
                ),
              ),
              SizedBox(height: 12),
              Text(
                'The hive of success has no shortcutsPollinate your dreams with persistenceBee-live in yourself your destined for greatness.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildIcon(Icons.download, "Download"),
                  buildIcon(Icons.link, "Link"),
                  buildIcon(Icons.add, "Plus"),
                  buildIcon(Icons.list, "List"),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Related Videos",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.play_circle_fill, color: Colors.red),
                      title: Text('Video Title ${index + 1}'),
                      subtitle: Text('Short description of video ${index + 1}'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // You can add navigation or action here
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}