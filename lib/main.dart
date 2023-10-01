import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/workers/workers_cubit.dart';
import 'package:front/config/auto_router_config.dart';
import 'package:front/data_sources/workers_data_source.dart';

import 'bloc/auth/auth_cubit.dart';
import 'data_sources/auth_data_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            AuthDataSource(),
          ),
        ),
        BlocProvider(
          create: (context) => WorkersCubit(
            WorkersDataSource(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
