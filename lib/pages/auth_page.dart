import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/auth/auth_cubit.dart';
import 'package:front/config/auto_router_config.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AuthPage();
  }
}

class _AuthPage extends StatefulWidget {
  const _AuthPage();

  @override
  State<_AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<_AuthPage> {
  final _codeController = TextEditingController();
  final _organizationIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(300.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(
                  hintText: 'Введите код',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _organizationIdController,
                decoration: const InputDecoration(
                  hintText: 'Введите id организации',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  context.read<AuthCubit>().requestCode();
                },
                child: const Text('Получить код'),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  context.read<AuthCubit>().getToken(_codeController.text);
                  context.router.push(const MainRoute());
                },
                child: const Text('Отправить код'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
