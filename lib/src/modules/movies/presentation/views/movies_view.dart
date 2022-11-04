import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/core/constants/movies_text.dart';
import 'package:movies_app/src/modules/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/src/modules/movies/presentation/widgets/movie_card.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  MoviesBloc get _moviesBloc => BlocProvider.of(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _moviesBloc.queryMoves();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
    );
  }

  _body() {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitialState) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is ErrorMoviesState) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(GeneralText.error),
                ElevatedButton(
                  onPressed: _moviesBloc.queryMoves,
                  child: Text(GeneralText.retry),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: MediaQuery.of(context).size.width * 0.05,
                    runSpacing: MediaQuery.of(context).size.height * .02,
                    children: [
                      ...state.movies!.map((e) => MovieCard(movie: e)).toList(),
                      const SizedBox(
                        height: 30,
                        width: double.maxFinite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 15, bottom: 30),
                height: MediaQuery.of(context).size.height * .075,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _moviesBloc.nextPage,
                      child: Text(
                        GeneralText.next,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }
}
