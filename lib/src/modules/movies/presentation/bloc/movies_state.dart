// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

@immutable
abstract class MoviesState extends Equatable {
  final List<MovieModel>? movies;
  final int? currentPage;

  MoviesState({
    List<MovieModel>? movies,
    this.currentPage,
  }) : movies = movies ?? List<MovieModel>.empty(growable: true);

  @override
  List<Object?> get props => [movies, currentPage];
}

class MoviesInitialState extends MoviesState {
  MoviesInitialState()
      : super(
          currentPage: 1,
          movies: List<MovieModel>.empty(growable: true),
        );
}

class QueryingMoviesState extends MoviesState {
  QueryingMoviesState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
  }) : super(
          movies: oldState.movies,
          currentPage: oldState.currentPage,
        );
}

class MoviesLoadedState extends MoviesState {
  MoviesLoadedState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
  }) : super(
          currentPage: currentPage ?? oldState.currentPage,
          movies: movies ?? oldState.movies,
        );
}

class ErrorMoviesState extends MoviesState {
  ErrorMoviesState.fromOldState(
    MoviesState oldState, {
    List<MovieModel>? movies,
    int? currentPage,
  }) : super(
          movies: oldState.movies,
          currentPage: oldState.currentPage,
        );
}
