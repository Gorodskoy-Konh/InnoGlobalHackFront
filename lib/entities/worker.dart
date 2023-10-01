import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';

part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  const factory Worker({
    required String id,
    required String login,
    @Default(('09:00', '18:00')) (String, String) workingSchedule,
    @Default({WeekDays.mon,WeekDays.tue,WeekDays.wed,WeekDays.thu,WeekDays.fri,}) Set<WeekDays> workingDays,
    @Default([]) List<String> stack,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) => _$WorkerFromJson(json);
}

enum WeekDays { mon('Пн'), tue('Вт'), wed('Ср'), thu('Чт'), fri('Пт'), sat('Сб'), sun('Вс');
final String name;

const WeekDays(this.name);
}

enum Stack {
  cpp('c++'),
  python('python'),
  backend('backend'),
  frontend('frontend'),
  react('react');

  const Stack(this.name);

  final String name;
}
