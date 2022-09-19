import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_ui_concept/layout/custom_app_bar.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsNotScrollable) => <Widget>[
          const CustomAppBar(),
        ],
        body: Flex(
          direction: Axis.vertical,
          children: [
            const SizedBox(
              height: 24,
            ),
            Flex(
              direction: Axis.horizontal,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.shuffle_outlined,
                      size: 24,
                    ),
                  ),
                ),
                const Spacer(),
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Safar',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Tathaagat Project",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const SizedBox(
                  width: 48,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => SizedBox(
                  height: 40,
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.go('/NowPlaying');
                        },
                        icon: const Icon(Icons.play_arrow),
                      ),
                      Flex(
                        direction: Axis.vertical,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Safar',
                            style: TextStyle(),
                          ),
                          Text('Tathaagat Project'),
                        ],
                      ),
                      const Text("04:00"),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
