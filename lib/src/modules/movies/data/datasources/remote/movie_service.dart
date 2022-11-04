import 'package:movies_app/src/core/clients/api_client.dart';
import 'package:movies_app/src/core/constants/endpoints.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';

class MovieService {
  final ApiClient _apiClient;

  MovieService(this._apiClient);

  Future<List<MovieModel>> getPopularMovies({required int page}) async {
    try {
      var response = await _apiClient.instance.get(
        MovieEndpoints.popular,
        queryParameters: {"page": page},
      );
      var parsed = (response.data["results"] as List)
          .map(
            (e) => MovieModel.fromMap(e),
          )
          .toList();
      return parsed;
    } catch (error) {
      rethrow;
    }
  }
}
