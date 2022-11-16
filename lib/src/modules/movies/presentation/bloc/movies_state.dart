// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

@immutable
abstract class MoviesState extends Equatable {
  final List<MovieModel>? movies;
  final int? currentPage;
  final MovieModel? selectedMovie;

  MoviesState({
    List<MovieModel>? movies,
    this.currentPage,
    this.selectedMovie,
  }) : movies = movies ?? List<MovieModel>.empty(growable: true);

  @override
  List<Object?> get props => [
        movies,
        currentPage,
        selectedMovie,
      ];
}

class MoviesInitialState extends MoviesState {
  MoviesInitialState()
      : super(
          currentPage: 1,
          selectedMovie: null,
          movies: List<MovieModel>.empty(growable: true),
        );
}

class QueryingMoviesState extends MoviesState {
  QueryingMoviesState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
    MovieModel? selectedModel,
  }) : super(
          movies: oldState.movies,
          currentPage: oldState.currentPage,
          selectedMovie: oldState.selectedMovie,
        );
}

class MoviesLoadedState extends MoviesState {
  MoviesLoadedState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
    MovieModel? selectedMovie,
  }) : super(
          currentPage: currentPage ?? oldState.currentPage,
          movies: movies ?? oldState.movies,
          selectedMovie: selectedMovie ?? oldState.selectedMovie,
        );
}

class ErrorMoviesState extends MoviesState {
  ErrorMoviesState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
    MovieModel? selectedMovie,
  }) : super(
          movies: oldState.movies,
          currentPage: oldState.currentPage,
          selectedMovie: oldState.selectedMovie,
        );
}
