import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({Key? key}) : super(key: key);
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreen();
}

class _MovieDetailsScreen extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Hey MovieDetails'),
      ),
    );
  }
}
