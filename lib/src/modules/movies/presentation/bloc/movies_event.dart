// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movies_bloc.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  final dynamic payload;

  const MoviesEvent({this.payload});

  @override
  List<Object> get props => [payload];
}

class MoviesInitialEvent extends MoviesEvent {}

class QueryMoviesEvent extends MoviesEvent {}

class LoadMoviesEvent extends MoviesEvent {
  const LoadMoviesEvent(Map<String, dynamic> movies) : super(payload: movies);
}

class ErrorMoviesEvent extends MoviesEvent {}

class SelectMovieEvent extends MoviesEvent {
  const SelectMovieEvent(MovieModel movie) : super(payload: movie);
}