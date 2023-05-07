import 'package:hooks_riverpod/hooks_riverpod.dart';

// this provider handles the view port index
// to animate the positon of each movie
final viewportIndexProvider = StateProvider((ref) => 0);
