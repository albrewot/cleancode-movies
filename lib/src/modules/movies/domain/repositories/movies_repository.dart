import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';

abstract class MoviesRepository {
  Future<List<MovieModel>> getPopularMovies(int page);
  Future<MovieModel> getMovieDetails(int id);
}
