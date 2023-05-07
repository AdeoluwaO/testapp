import 'dart:async';
import 'package:dio/dio.dart';

final dio = Dio();
const String apiKey = '187d2a9c2c1a66c6beac88a4c4681554';
const String authToken =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxODdkMmE5YzJjMWE2NmM2YmVhYzg4YTRjNDY4MTU1NCIsInN1YiI6IjY0MDM3ZWJmNjdkY2M5MDBkNDgxNTRjOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.wqo-ssgurxa_rBWyGWtiISS2G_eAtVAIlex9NALP7W0';
//'https://api.themoviedb.org/3/trending/movie/day?language=en-US'
Future<List<dynamic>> getTrendingMovies() async {
  const url = 'https://api.themoviedb.org/3/trending/movie/day?language=en-US';

  final response = await dio.get(url,
      options: Options(headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $authToken'
      }));

  if (response.statusCode == 200) {
    final data = response.data;
    return data['results'];
  } else {
    throw Exception('Sorry an Erro occured...!!!');
  }
}
