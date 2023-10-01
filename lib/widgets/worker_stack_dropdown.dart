import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/workers/workers_cubit.dart';
import 'package:multiselect/multiselect.dart';

class WorkerStackDropdown extends StatefulWidget {
  const WorkerStackDropdown({super.key, required this.workerId});

  final String workerId;

  @override
  State<WorkerStackDropdown> createState() => _WorkerStackDropdownState();
}

class _WorkerStackDropdownState extends State<WorkerStackDropdown> {
  List<String> stack = ['c++', 'python', 'java', 'pytorch', 'sql'];

  @override
  Widget build(BuildContext context) {
    final workersState = context.watch<WorkersCubit>().state;
    final worker = workersState is WorkersCreated
        ? workersState.workers[widget.workerId]
        : null;
    return DropDownMultiSelect<String>(
      decoration: const InputDecoration(hintText: 'Укажите навыки работника'),
      options: stack,
      selectedValues: List.of(worker!.stack),
      onChanged: (selectedValues) => setState(
        () {
          context.read<WorkersCubit>().updateWorker(
                worker.copyWith(
                  stack: selectedValues,
                ),
              );
        },
      ),
    );
  }
}
