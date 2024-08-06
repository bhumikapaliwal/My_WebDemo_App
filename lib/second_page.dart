import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
@RoutePage()
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Page')),
      body: Center(child: Text('Welcome to the Second Page')),
    );
  }
}
