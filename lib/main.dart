import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/src/core/clients/injector.dart';
import 'package:movies_app/src/core/constants/routes.dart';
import 'package:movies_app/src/modules/movies/presentation/bloc/movies_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => injector<MoviesBloc>(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MoviesRoutes.movieListRoute,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        navigatorKey: AppRoutes.navKey,
      ),
    );
  }
}
