import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';

void main(){
  serviceLocatorInit();
  runApp(const BlocsProvider());
}

class BlocsProvider extends StatelessWidget {
  const BlocsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(create: (context) => getIt<UsernameCubit>(),),
          BlocProvider(create: (context) => getIt<RouterSimpleCubit>(),),
          BlocProvider(create: (context) => getIt<CounterCubit>()),
          BlocProvider(create: (context) => getIt<ThemeCubit>()),
          BlocProvider(create: (context) => getIt<GuestBloc>()),
          BlocProvider(create: (context) => getIt<PokemonBloc>()),
          BlocProvider(create: (context) => getIt<GeolocationCubit>()),
          BlocProvider(create: (context) => getIt<HistoricLocationBloc>()),

      ],
       child: const MyApp());
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter = context.watch<RouterSimpleCubit>().state;
    final isDarkMode = context.watch<ThemeCubit>().state.isDarkmode;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: isDarkMode ).getTheme(),
    );
  }
}
