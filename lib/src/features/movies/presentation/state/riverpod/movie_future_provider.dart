import 'package:hooks_riverpod/hooks_riverpod.dart';

// local imports
import '../../../data/api/get_movies.dart';
import '../../../domain/model/movie_model.dart';

// the state that handles fetching the movies
final movieProvider = FutureProvider((ref) async {
  final movies = await getTrendingMovies();
  final mappedMovies =
      movies.map((movie) => MovieModel.fromJson(movie)).toList();
  return mappedMovies;
});
