import 'package:flutter/material.dart';
import 'package:movies_app/src/modules/movies/presentation/views/movies_view.dart';

class AppRoutes {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      MoviesRoutes.movieListRoute: (context) => const MoviesView(),
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
}
