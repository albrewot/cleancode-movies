import 'package:get_it/get_it.dart';
import 'package:movies_app/src/core/clients/api_client.dart';
import 'package:movies_app/src/modules/movies/data/datasources/remote/movie_service.dart';
import 'package:movies_app/src/modules/movies/data/repositories/movies_repository_impl.dart';
import 'package:movies_app/src/modules/movies/domain/repositories/movies_repository.dart';
import 'package:movies_app/src/modules/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/src/modules/movies/presentation/bloc/movies_bloc.dart';

GetIt injector = GetIt.I;

Future<void> initializeDependencies() async {
  _initializeClients();
  _initializeServices();
  _initializeRepositories();
  _initializeUseCases();
  _initializeBlocs();
}

_initializeClients() {
  injector.registerSingleton<ApiClient>(ApiClient());
}

_initializeServices() {
  injector.registerSingleton<MovieService>(
    MovieService(
      injector.get(),
    ),
  );
}

_initializeRepositories() {
  injector.registerSingleton<MoviesRepository>(
    MoviesRepositoryImpl(
      injector.get(),
    ),
  );
}

_initializeUseCases() {
  injector.registerSingleton<GetPopularMoviesUseCase>(
    GetPopularMoviesUseCase(
      injector.get(),
    ),
  );
}

_initializeBlocs() {
  injector.registerFactory<MoviesBloc>(
    () => MoviesBloc(
      injector.get(),
    ),
  );
}
