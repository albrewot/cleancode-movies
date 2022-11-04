import 'package:flutter/material.dart';
import 'package:movies_app/src/core/constants/assets.dart';
import 'package:movies_app/src/core/constants/endpoints.dart';
import 'package:movies_app/src/core/constants/movies_text.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .40,
      height: MediaQuery.of(context).size.height * .30,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 8.0,
            offset: const Offset(8, 8),
            spreadRadius: 0,
            color: Colors.black.withOpacity(.15),
          ),
        ],
      ),
      child: Column(
        children: [
          //https://image.tmdb.org/t/p/original
          Image.network(
            MovieEndpoints.image + movie.posterPath,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(Assets.placeholder);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress == null){
                return child;
              }
              return Image.asset(Assets.placeholder);
            },
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
