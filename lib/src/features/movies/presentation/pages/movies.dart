import 'package:flutter/material.dart';

// local imports
import '../ui/widget/movie_structure.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MovieStructure();
  }
}
