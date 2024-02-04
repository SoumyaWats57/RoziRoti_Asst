import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/song.dart';

class MusicPlayer extends StatefulWidget {
  static const routeName = '/music-player';
  const MusicPlayer({Key? key}) : super(key: key);

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  // List of Song objects representing different songs
  List<Song> songs = [
    // Song details (title, singer, file paths)
    Song(
      title: "Shree Ram Ram",
      singer: "Antariksh",
      filePath: "assets/images/shreeRam1.jpg",
      audioPath: "music/Lord Ram Mantra - Shree Ram Ram Rameti Mantra.mp3",
    ),
    // ... (similar entries for other songs)
    Song(
      title: "Ram Aayenge",
      singer: "Vishal Mishra",
      filePath: "assets/images/shreeRam2.jpeg",
      audioPath: "music/Ram Aayenge - Vishal Mishra.mp3",
    ),
    Song(
      title: "Ram Siya Ram",
      singer: "Sonu Nigam",
      filePath: "assets/images/shreeRam3.jpg",
      audioPath: "music/Ram Siya Ram - Sonu Nigam.mp3",
    ),
    Song(
      title: "Tumhein Pukara",
      singer: "Hariharan",
      filePath: "assets/images/shreeRam4.jpg",
      audioPath: "music/Sabne Tumhein  Pukara Shree Ram Ji - Hariharan.mp3",
    ),
  ];

  // State variables for managing the player and playback status
  bool isPlaying = false;
  double value = 0;
  int currentSongIndex = 0;
  final player = AudioPlayer();
  Duration? duration;

  // Initialize the audio player with the first song
  void initPlayer() async {
    await player.setSourceAsset(songs[currentSongIndex].audioPath);
    duration = await player.getDuration();
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // AppBar title and styling
        title: Text(
          'Musics',
          style: GoogleFonts.kavoon(),
        ),
        // AppBar background color and elevation
        backgroundColor: const Color.fromARGB(255, 204, 133, 34),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background container with blurred image
          Container(
            constraints: const BoxConstraints.expand(),
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  songs[currentSongIndex].filePath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
              child: Container(
                color: Colors.black.withOpacity(0.6),
              ),
            ),
          ),
          // Column with song details and controls
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Album art
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  songs[currentSongIndex].filePath,
                  width: 250.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // Song title
              Text(
                songs[currentSongIndex].title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 36, letterSpacing: 6),
              ),
              const SizedBox(
                height: 18.0,
              ),
              // Singer name
              Text(
                songs[currentSongIndex].singer,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 50.0,
              ),
              // Playback controls and slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display current playback time
                  Text(
                    "${(value / 60).floor()}: ${(value % 60).floor()}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  // Slider for seeking through the song
                  SizedBox(
                    width: 260.0,
                    child: Slider.adaptive(
                      onChangeEnd: (newValue) async {
                        setState(() {
                          value = newValue;
                        });
                        // Seek to the selected position in the song
                        if (duration != null) {
                          await player
                              .seek(Duration(seconds: newValue.toInt()));
                        }
                      },
                      min: 0.0,
                      value: value,
                      max: duration?.inSeconds.toDouble() ?? 214.0,
                      onChanged: (value) {},
                      activeColor: Colors.white,
                    ),
                  ),
                  // Display total duration of the song
                  Text(
                    "${duration == null ? 0 : duration!.inMinutes} : ${duration == null ? 0 : duration!.inSeconds % 60}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              // Playback control buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Previous song button
                  currentSongIndex == 0
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.black87,
                            border: Border.all(color: Colors.white38),
                          ),
                          width: 50.0,
                          height: 50.0,
                          child: InkWell(
                            onTap: () {
                              playPreviousSong();
                            },
                            child: const Center(
                              child: Icon(
                                Icons.skip_previous_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                  // Play/Pause button
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      color: Colors.black87,
                      border: Border.all(color: Colors.pink),
                    ),
                    width: 60.0,
                    height: 60.0,
                    child: InkWell(
                      onTap: () async {
                        // Pause or resume the audio player
                        if (isPlaying) {
                          await player.pause();
                        } else {
                          await player.resume();
                          // Update the slider position as the song plays
                          player.onPositionChanged.listen(
                            (Duration d) {
                              setState(() {
                                value = d.inSeconds.toDouble();
                              });
                            },
                          );
                        }

                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: Center(
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // Next song button
                  currentSongIndex == 3
                      ? Container()
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            color: Colors.black87,
                            border: Border.all(color: Colors.white38),
                          ),
                          width: 50.0,
                          height: 50.0,
                          child: InkWell(
                            onTap: () {
                              playNextSong();
                            },
                            child: const Center(
                              child: Icon(
                                Icons.skip_next_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  // Play the next song in the list
  void playNextSong() {
    if (currentSongIndex < songs.length - 1) {
      currentSongIndex++;
      changeSong();
    }
  }

  // Play the previous song in the list
  void playPreviousSong() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      changeSong();
    }
  }

  // Change the current song and update player settings
  void changeSong() async {
    await player.stop();
    await player.setSourceAsset(songs[currentSongIndex].audioPath);
    await player.resume();
    duration = await player.getDuration();
    setState(() {
      value = 0;
      isPlaying = true; // Change to pause icon when changing the song
    });
  }

  @override
  void dispose() {
    player.dispose(); // Stop the audio player when the widget is disposed
    super.dispose();
  }
}
