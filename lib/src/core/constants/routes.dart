import 'package:flutter/material.dart';
import 'package:movies_app/src/modules/movies/data/models/movie_model.dart';
import 'package:movies_app/src/modules/movies/presentation/views/movie_details_view.dart';
import 'package:movies_app/src/modules/movies/presentation/views/movies_view.dart';

class AppRoutes {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      MoviesRoutes.movieListRoute: (context) => const MoviesView(),
      MoviesRoutes.detailsROute: (context) => MovieDetailsView(
            movie: settings.arguments as MovieModel,
          ),
    };

    WidgetBuilder builder = routes[settings.name]!;
    print("Route [${settings.name}] | args: ${settings.arguments}");

    return PageRouteBuilder(
      pageBuilder: (context, _, __) => builder(context),
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}

abstract class MoviesRoutes {
  static String movieListRoute = "/";
  static String detailsROute = "/details";
}
