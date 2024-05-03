import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final geolocationCubit = context.watch<GeolocationCubit>().state.location;
    final locations = context.watch<HistoricLocationBloc>().state.locations;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones ${locations.length}'),
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Ubicacion actual: $geolocationCubit'),
          const SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    final location = locations[index];
                    final (lat,lng) = location;
                    return ListTile(
                      title: Text('Lat: $lat Lng: $lng'),
                    );
                },)
                ),
                const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}