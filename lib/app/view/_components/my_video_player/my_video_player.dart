import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:vemare/app/view/_components/my_shimmer/my_shimmer.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({
    required this.video,
    Key? key,
  }) : super(key: key);

  final String video;

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    _initializePlayer();
    super.initState();
  }

  Future<void> _initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.video);

    await _videoPlayerController.initialize();
    setState(() {
      _createChewieController();
    });
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: false,
      looping: false,
      hideControlsTimer: const Duration(seconds: 5),
      showOptions: false,
    );
  }

  Future<void> toggleVideo() async {
    await _videoPlayerController.pause();
    await _initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.antiAlias,
            children: [
              Positioned.fill(
                child: Center(
                  child: _videoPlayerController.value.isInitialized
                      ? _chewieController != null
                          ? Chewie(
                              controller: _chewieController!,
                            )
                          : Container()
                      : const MyShimmer(
                          height: 250,
                        ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
