import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/auth/auth_cubit.dart';
import 'package:front/bloc/workers/workers_cubit.dart';
import 'package:front/widgets/worker_stack_dropdown.dart';
import 'package:front/widgets/working_schedule_widget.dart';

@RoutePage()
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthCubit>().state;
    if (authState is AuthTokenOrganizationSaved) {
      context.read<WorkersCubit>().workers(
            authState.token,
            authState.organizationId,
          );
    }
    // context.read<WorkersCubit>().workers('dfgd', 'dfgdfg');
  }

  DateTime? _endSprint;
  final _endSprintController = TextEditingController();
  final _backlogIdController = TextEditingController();
  final _sprintNameController = TextEditingController();
  final _queueIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;
    final workersState = context.watch<WorkersCubit>().state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Настройте работников и спринт',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: workersState is WorkersCreated
          ? Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                left: 80,
                right: 80,
              ),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, i) => const Divider(),
                    itemCount: workersState.workers.keys.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        // mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(
                                value: workersState.selectedWorkerIds.contains(
                                  workersState.workers.keys.toList()[i],
                                ),
                                onChanged: (value) => context
                                    .read<WorkersCubit>()
                                    .changeWorkerSelection(
                                      workersState.workers.keys.toList()[i],
                                    ),
                              ),
                              Text(workersState
                                      .workers[
                                          workersState.workers.keys.toList()[i]]
                                      ?.login ??
                                  ''),
                            ],
                          ),
                          WorkingScheduleWidget(
                            workerId: workersState.workers.keys.toList()[i],
                          ),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50.0),
                            child: WorkerStackDropdown(
                              workerId: workersState.workers.keys.toList()[i],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Text('Окончание спринта'),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Выберите окончание спринта'),
                          controller: _endSprintController,
                          onTap: () async {
                            final date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(3000));
                            setState(() {
                              _endSprint = date;
                              _endSprintController.text = date.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('ID Доски'),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'ID Доски'),
                          controller: _backlogIdController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('ID Очереди'),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'ID Очереди'),
                          controller: _queueIdController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Название создаваемого спринта'),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Название создаваемого спринта'),
                          controller: _sprintNameController,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final authState = context.read<AuthCubit>().state;
                      if (authState is AuthTokenOrganizationSaved) {
                        context.read<WorkersCubit>().sendWorkers(
                              _endSprint!,
                              _queueIdController.text,
                              _backlogIdController.text,
                              _sprintNameController.text,
                              authState.token,
                              authState.organizationId,
                            );
                      }
                    },
                    child: const Text(
                      'Начать распределение!',
                    ),
                  ),
                ],
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
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
