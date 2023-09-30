import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';

part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    required String id,
    required List<(int, int)> workingSchedule,
    required List<Stack> stack,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}

enum WeekDays { mon, tue, wed, thu, fri, sat, sun }

enum Stack {
  cpp('c++'),
  python('python'),
  backend('backend'),
  frontend('frontend'),
  react('react');

  const Stack(this.name);

  final String name;
}
