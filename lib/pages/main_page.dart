import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/auth/auth_cubit.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, id) => ListTile(
          leading: Text('worker'),
        ),
      ),
      // body: Center(
      //   child: switch (authState) {
      //     AuthSuccessful authState => Text(authState.token),
      //     AuthError error => Text('Error ${error.message}'),
      //     AuthLoading() || AuthInitial() => const CircularProgressIndicator(),
      //   },
      // ),
    );
  }
}
