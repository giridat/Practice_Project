import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:music_player_ui_concept/screens/authorisation_screen.dart';
import 'package:music_player_ui_concept/screens/library_page.dart';
import 'package:music_player_ui_concept/screens/now_playing_page.dart';
import 'package:music_player_ui_concept/screens/splash_screen.dart';

class Routes {
  static GoRouter routerNavigation() {
    return GoRouter(
      initialLocation: '/Authorisation',
      routes: <GoRoute>[
        GoRoute(
          path: '/Authorisation',
          builder: (BuildContext context, GoRouterState state) =>
              const Authorisation(),
        ),
        GoRoute(
          path: "/SplashScreen",
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: "/LibraryPage",
          builder: (BuildContext context, GoRouterState state) =>
              const LibraryPage(),
        ),
        GoRoute(
          path: "/NowPlaying",
          builder: (BuildContext context, GoRouterState state) =>
              const NowPlaying(),
        )
      ],
    );
  }
}
