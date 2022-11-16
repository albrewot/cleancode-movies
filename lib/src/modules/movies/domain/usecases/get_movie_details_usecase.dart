import 'package:movies_app/src/core/models/usecase.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/domain/repositories/movies_repository.dart';

class GetMovieDetailsUseCase implements UseCase<MovieModel, int> {
  final MoviesRepository _moviesRepository;

  GetMovieDetailsUseCase(this._moviesRepository);

  @override
  Future<MovieModel> call([int? id]) async {
    try {
      var response = await _moviesRepository.getMovieDetails(id!);
      return response;
    } catch (error) {
      rethrow;
    }
  }
}
