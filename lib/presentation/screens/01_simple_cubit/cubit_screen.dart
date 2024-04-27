import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final usernameCubit = context.watch<UsernameCubit>();
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
          child: BlocBuilder<UsernameCubit, String>(
            buildWhen: (previous, current) => previous != current,
        builder: (context, state) => Text(state, style: textStyle.titleLarge,),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ! por lo general se usa el read dentro de una funcion, es parecido a lo que es el riverpod
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
