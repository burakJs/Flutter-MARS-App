import 'package:flutter/material.dart';
import 'package:mars_project/views/ice_cream_home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: IceCreamHomeView(),
    );
  }
}
