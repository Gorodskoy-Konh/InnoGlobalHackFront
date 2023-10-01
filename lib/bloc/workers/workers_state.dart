part of 'workers_cubit.dart';

@immutable
sealed class WorkersState {}

class WorkersInitial extends WorkersState {}

class WorkersLoading extends WorkersState {}

class WorkersError extends WorkersState {
  final String? message;

  WorkersError([this.message]);
}

class WorkersCreated extends WorkersState {
  final Set<String> selectedWorkerIds;
  final Map<String, Worker> workers;

  WorkersCreated({
    this.selectedWorkerIds = const {},
    required this.workers,
  });
}
