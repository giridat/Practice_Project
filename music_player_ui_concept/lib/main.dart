import 'package:flutter/material.dart';
import 'model/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _router = Routes.routerNavigation();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>
      MaterialApp.router(routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate);
}
