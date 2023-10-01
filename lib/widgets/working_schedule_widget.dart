import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/bloc/workers/workers_cubit.dart';

import '../entities/worker.dart';

class WorkingScheduleWidget extends StatefulWidget {
  const WorkingScheduleWidget({super.key, required this.workerId});

  final String workerId;

  @override
  State<WorkingScheduleWidget> createState() => _WorkingScheduleWidgetState();
}

class _WorkingScheduleWidgetState extends State<WorkingScheduleWidget> {
  final _timeFromController = TextEditingController();
  final _timeToController = TextEditingController();

  Worker updateTime(Worker worker, String timeFrom, String timeTo) {
    return worker.copyWith(
      workingSchedule: (timeFrom, timeTo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final workersState = context.watch<WorkersCubit>().state;
    final worker = workersState is WorkersCreated
        ? workersState.workers[widget.workerId]
        : null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: WeekDays.values
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 2.0,
                  ),
                  child: FilterChip(
                    label: Text(e.name),
                    labelPadding: const EdgeInsets.all(0),
                    showCheckmark: false,
                    selected: worker!.workingDays.contains(e),
                    onSelected: (value) {
                      setState(() {
                        final workingDays =
                            Set<WeekDays>.from(worker.workingDays);
                        if (workingDays.contains(e)) {
                          context.read<WorkersCubit>().updateWorker(
                                worker.copyWith(
                                  workingDays: workingDays..remove(e),
                                ),
                              );
                        } else {
                          context.read<WorkersCubit>().updateWorker(
                                worker.copyWith(
                                  workingDays: workingDays..add(e),
                                ),
                              );
                        }
                      });
                    },
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          width: 15,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('с'),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 100,
              child: TextFormField(
                  controller: _timeFromController,
                  decoration: const InputDecoration(
                    hintText: '09:00',
                    prefixIcon: Icon(
                      Icons.access_time_outlined,
                      size: 15,
                    ),
                  ),
                  onTap: () async {
                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      _timeFromController.text = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                      context.read<WorkersCubit>().updateWorker(updateTime(worker!, _timeFromController.text+':00', _timeToController.text+':00'));
                    }
                  }),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text('до'),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 100,
              child: TextFormField(
                  controller: _timeToController,
                  decoration: const InputDecoration(
                    hintText: '18:00',
                    prefixIcon: Icon(
                      Icons.access_time_outlined,
                      size: 15,
                    ),
                  ),
                  onTap: () async {

                    final time = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (time != null) {
                      _timeToController.text = '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
                      context.read<WorkersCubit>().updateWorker(updateTime(worker!, _timeFromController.text + ':00', _timeToController.text + ':00'));
                    }
                  }),
            ),
          ],
        ),
      ],
    );
  }
}
