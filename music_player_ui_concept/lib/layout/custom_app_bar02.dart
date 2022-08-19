import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar02 extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar02({Key? key}) : super(key: key);

  @override
  State<CustomAppBar02> createState() => _CustomAppBar02State();

  @override
  Size get preferredSize => const Size.fromHeight(55);
}

class _CustomAppBar02State extends State<CustomAppBar02> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          context.go('/LibraryPage');
        },
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz_outlined),
          color: Colors.black,
        ),
      ],
      title: const Text(
        'NOW PLAYING',
        style: TextStyle(
          fontFamily: 'assets/fonts/Inter-SemiBold.otf',
          color: Colors.grey,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
