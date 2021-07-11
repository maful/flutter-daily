import 'package:flutter/material.dart';
import 'package:riverpod_infinite/posts/posts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PostsPage(),
    );
  }
}
