import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/core/constants/assets.dart';
import 'package:movies_app/src/core/constants/endpoints.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/presentation/bloc/movies_bloc.dart';

class MovieDetailsView extends StatefulWidget {
  final MovieModel movie;
  const MovieDetailsView({Key? key, required this.movie}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  MoviesBloc get _moviesBloc => BlocProvider.of(context);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getDetails();
  }

  _getDetails() {
    _moviesBloc.selectMovie(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar();
  }

  _body() {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state.selectedMovie == null) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                MovieEndpoints.image + state.selectedMovie!.posterPath,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(Assets.placeholder);
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Image.asset(Assets.placeholder);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
