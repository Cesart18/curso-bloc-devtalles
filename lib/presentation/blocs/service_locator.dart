import 'package:get_it/get_it.dart';

import 'package:blocs_app/config/config.dart';
import 'blocs.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestBloc());
  getIt.registerSingleton(
      PokemonBloc(
        fetchPokemon: PokemonInformation.getPokemonName));
        // ! esta es una forma de inyectar la dependencia de otro bloc
  // final historicBloc = getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(HistoricLocationBloc());
  getIt.registerSingleton(
    GeolocationCubit(
      // onNewUserLocationCallback: historicBloc.onNewUserLocation
      onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation
    )
      ..watchUserLocation());
}
