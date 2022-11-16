import 'package:movies_app/src/modules/movies/data/datasources/remote/movie_service.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieService _movieService;

  MoviesRepositoryImpl(this._movieService);

  @override
  Future<List<MovieModel>> getPopularMovies(int page) async {
    try {
      var response = await _movieService.getPopularMovies(page: page);
      return response;
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<MovieModel> getMovieDetails(int id) async {
    try {
      var response = await _movieService.getMovieDetails(id);
      var parsed = MovieModel.fromMap(response);
      return parsed;
    } catch (error) {
      rethrow;
    }
  }
}
