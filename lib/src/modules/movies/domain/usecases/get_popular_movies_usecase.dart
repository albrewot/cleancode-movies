import 'package:movies_app/src/core/models/usecase.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/domain/repositories/movies_repository.dart';

class GetPopularMoviesUseCase implements UseCase<List<MovieModel>, int> {
  final MoviesRepository _moviesRepository;

  GetPopularMoviesUseCase(this._moviesRepository);

  @override
  Future<List<MovieModel>> call([int? page]) async {
    try {
      var response = await _moviesRepository.getPopularMovies(page!);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
