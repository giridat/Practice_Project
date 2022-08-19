import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player_ui_concept/layout/custom_app_bar02.dart';
import 'package:music_player_ui_concept/model/time.dart';

class NowPlaying extends StatefulWidget {
  const NowPlaying({Key? key}) : super(key: key);

  @override
  State<NowPlaying> createState() => _NowPlayingState();
}

class _NowPlayingState extends State<NowPlaying> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  FormattedTime time = FormattedTime();

  // AudioCache audioCache = AudioCache(prefix: 'audio/');

  final player = AudioPlayer();
  bool isPaused = false;
  bool isPlaying = false;
  String prefix =
      'D:/Practice_Project/music_player_ui_concept/assets/audio/02 My Sould Side Journey - My Queen.mp3';
  String url =
      'https://drive.google.com/file/d/1VyPEwxQUorfqtKuLumUpZZFKmUtV2uWO/view?usp=sharing';

  @override
  void initState() {
    super.initState();

    player.onPlayerStateChanged.listen((state) {
      setState(() => isPlaying = state == PlayerState.playing);
    });

    player.onDurationChanged.listen((newDuration) {
      setState(() => duration = newDuration);
    });

    player.onPositionChanged.listen((newPosition) {
      setState(() => position = newPosition);
    });
    player.onPlayerComplete.listen((state) {
      setState(() => position = duration);
    });
  }

  @override
  void dispose() {
    player.release();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar02(),
      body: Flex(
        direction: Axis.vertical,
        children: [
          const SizedBox(height: 90),
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/Curved_Line.svg',
                color: Colors.black,
                fit: BoxFit.cover,
              ),
              SvgPicture.asset(
                'assets/images/Vinyl_disc_icon.svg',
                height: 160,
                width: 50,
                fit: BoxFit.cover,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/tathaagat_cover.jpeg',
                    height: 100,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Flex(
            direction: Axis.vertical,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'PLACE_HOLDER',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 15),
              Flex(
                direction: Axis.horizontal,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('PLACE_HOLDER'),
                  SizedBox(width: 8),
                  Icon(
                    Icons.verified,
                    color: Colors.blueAccent,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Flex(
            direction: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                child: Slider(
                    activeColor: Colors.black,
                    inactiveColor: Colors.black,
                    thumbColor: Colors.black,
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) async {
                      final position = Duration(seconds: value.toInt());
                      await player.seek(position);
                      if (isPlaying == false) {
                        await player.resume();
                      }
                    }),
              ),
              Flex(
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      time.formatTime(position),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 32.0),
                    child: Text(
                      time.formatTime(duration - position),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shuffle_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fast_rewind_outlined,
                      size: 30,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async => {
                      if (isPlaying)
                        {await player.pause()}
                      else if (isPlaying != true)
                        {
                          await player.play(
                            UrlSource(url),
                          )
                        }
                    },
                    child: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled_outlined
                          : Icons.play_circle_fill_outlined,
                      size: 60,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.fast_forward_outlined,
                      size: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.repeat,
                      size: 30,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 32, right: 31),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list_outlined),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_border),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
