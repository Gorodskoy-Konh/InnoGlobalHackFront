import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:front/data_sources/workers_data_source.dart';

import '../../entities/worker.dart';

part 'workers_state.dart';

class WorkersCubit extends Cubit<WorkersState> {
  WorkersCubit(this._workersDataSource) : super(WorkersInitial());

  final WorkersDataSource _workersDataSource;

  Future<void> workers(String token, String orgId) async {
    emit(WorkersLoading());
    try {
      final ids = await _workersDataSource.fetchWorkersId(token, orgId);
      emit(
        WorkersCreated(
          workers: Map.fromEntries(
            ids.map(
              (e) {
                final (id, login) = e;
                return MapEntry(
                  id,
                  Worker(id: id, login: login),
                );
              },
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  void updateWorker(Worker worker) {
    switch (state) {
      case WorkersCreated state:
        final workers = state.workers;
        workers[worker.id] = worker;
        emit(
          WorkersCreated(
            workers: workers,
            selectedWorkerIds: state.selectedWorkerIds,
          ),
        );
        print('worker updated');
        break;
      default:
        break;
    }
  }

  bool isWorkerSelected(String workerId) {
    switch (state) {
      case WorkersCreated state:
        return state.selectedWorkerIds.contains(workerId);
      default:
        return false;
    }
  }

  void changeWorkerSelection(String workerId) {
    switch (state) {
      case WorkersCreated state:
        final selectedWorkerIds = Set<String>.from(state.selectedWorkerIds);
        if (!selectedWorkerIds.contains(workerId)) {
          selectedWorkerIds.add(workerId);
        } else {
          selectedWorkerIds.remove(workerId);
        }
        emit(
          WorkersCreated(
            workers: state.workers,
            selectedWorkerIds: selectedWorkerIds,
          ),
        );
        break;
      default:
        break;
    }
  }

  Future<void> sendWorkers(
    DateTime sprintEnd,
    String queueId,
    String boardId,
    String sprintName,
    String token,
    String orgId,
  ) async {
    switch (state) {
      case WorkersCreated state:
        await _workersDataSource.sendWorkers(
          state.workers.entries
              .where((element) => state.selectedWorkerIds.contains(element.key))
              .map((e) => e.value)
              .toList(),
          sprintEnd,
          queueId,
          boardId,
          sprintName,
          token,
          orgId,
        );
        print('Successfully sent!!!');
        break;
      default:
        break;
    }
  }
}
