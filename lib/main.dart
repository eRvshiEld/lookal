import 'package:flutter/material.dart';
import 'package:lookal/farmers_page.dart';
import 'package:lookal/new_post_page.dart';
import 'package:lookal/post_details_page.dart';
import 'package:lookal/posts_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lookal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PostDetailsPage(),
    );
  }
}
