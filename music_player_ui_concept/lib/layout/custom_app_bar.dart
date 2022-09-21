import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_ui_concept/style/appbar_gradient_color.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      snap: true,
      floating: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          context.go('/SplashScreen');
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_outlined, color: Colors.black),
        ),
      ],
      backgroundColor: Colors.transparent,
      expandedHeight: 355,
      // pinned: true,
      flexibleSpace: Flex(
        mainAxisSize: MainAxisSize.min,
        direction: Axis.vertical,
        children: [
          Flexible(
            flex: 7,
            child: Stack(
              children: [
                DecoratedBox(
                  decoration: ColorGradient.deco,
                  child: const SizedBox(
                    height: 300,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Flex(
                      clipBehavior: Clip.hardEdge,
                      mainAxisSize: MainAxisSize.min,
                      direction: Axis.vertical,
                      children: [
                        const Text("Album"),
                        const SizedBox(
                          height: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/tathaagat_cover.jpeg',
                            height: 161,
                            width: 222,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
