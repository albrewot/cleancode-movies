// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/src/core/constants/movies_text.dart';
import 'package:movies_app/src/core/managers/navigator_manager.dart';
import 'package:movies_app/src/core/widgets/general/loading_overlay.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/domain/usecases/get_popular_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  MoviesBloc(
    this._getPopularMoviesUseCase,
  ) : super(MoviesInitialState()) {
    _initial();
    _queryMovies();
    _loadMovies();
    _errorMovies();
  }

  queryMoves() async {
    try {
      add(QueryMoviesEvent());
      var response = await LoadingOverlay.whileFuture(
        _getPopularMoviesUseCase(state.currentPage),
      );
      add(
        LoadMoviesEvent(
          {"movies": response, "page": state.currentPage},
        ),
      );
    } catch (error) {
      add(ErrorMoviesEvent());
      NavigatorManager.errorDialog();
    }
  }


  nextPage() async {
    try {
      int nextPage = state.currentPage! + 1;
      add(QueryMoviesEvent());
      var response = await LoadingOverlay.whileFuture(
        _getPopularMoviesUseCase(nextPage),
      );
      add(
        LoadMoviesEvent(
          {"movies": response, "page": nextPage},
        ),
      );
    } catch (error) {
      add(ErrorMoviesEvent());
      NavigatorManager.errorDialog();
    }
  }

  _initial() {
    on<MoviesInitialEvent>((event, emit) {
      emit(MoviesInitialState());
    });
  }

  _queryMovies() {
    on<QueryMoviesEvent>(
      (event, emit) {
        emit(QueryingMoviesState.fromOldState(state));
      },
    );
  }

  _loadMovies() {
    on<LoadMoviesEvent>(
      (event, emit) {
        emit(MoviesLoadedState.fromOldState(
          state,
          movies: event.payload["movies"],
          currentPage: event.payload["page"],
        ));
      },
    );
  }

  _errorMovies() {
    on<ErrorMoviesEvent>(
      (event, emit) {
        emit(ErrorMoviesState.fromOldState(state));
      },
    );
  }

  reset() {
    add(MoviesInitialEvent());
  }
}
