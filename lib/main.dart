import 'package:flutter/material.dart';
import 'router.dart';

void main() {
  final appRouter = AppRouter();

  runApp(MyApp(appRouter: appRouter));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter.config(),
    );
  }
}
