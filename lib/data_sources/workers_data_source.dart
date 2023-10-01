import 'package:dio/dio.dart';
import 'package:front/url_consts.dart';

import '../entities/worker.dart';

class WorkersDataSource {
  late final Dio _dio;

  WorkersDataSource() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor());
  }

  Future<List<(String, String)>> fetchWorkersId(
      String token, String orgId) async {
    final tk = 'y0_AgAAAAAcjc5mAAqT2gAAAADt5mx-c-pryxV-SCqYb_COROZy1e0uDxw';
    final o_id = 'bpfv02uluj60f04vp1b3';
    final response = await _dio.request(
      '$kbackUrl$kWorkersUrl',
      options: Options(
        method: 'GET',
        headers: {
          'token': token,
          'org_id': orgId,
        },
      ),
    );
    return (response.data as List)
        .map((e) => (e['uid'].toString(), e['login'].toString()))
        .toList();
    // return Future.delayed(
    //   const Duration(seconds: 1),
    //   () => [
    //     'worker1',
    //     'worker2',
    //     'worker3',
    //   ],
    // );
  }

  Future<void> sendWorkers(
    List<Worker> workers,
    DateTime sprintEnd,
    String queueId,
    String boardId,
    String sprintName,
    String token,
    String orgId,
  ) async {
    final tk = 'y0_AgAAAAAcjc5mAAqT2gAAAADt5mx-c-pryxV-SCqYb_COROZy1e0uDxw';
    final o_id = 'bpfv02uluj60f04vp1b3';
    var workersData = [];
    for (final worker in workers) {
      var schedule = [];
      for (int i = 0; i < WeekDays.values.length; ++i) {
        if (worker.workingDays.contains(WeekDays.values[i])) {
          schedule.add([
            [worker.workingSchedule?.$1, worker.workingSchedule?.$2]
          ]);
        } else {
          schedule.add([]);
        }
      }
      workersData.add({
        'id': worker.id,
        'stack': worker.stack,
        'schedule': schedule,
      });
    }
    final data = {
      'workers': workersData,
      'end': sprintEnd.toString(),
      'board_id': boardId,
      'sprint_name': sprintName,
    };
    print(data);
    final response = await _dio.post(
      '$kbackUrl/workers/assign/$queueId',
      data: data,
      options: Options(
        headers: {
          'token': token,
          'org_id': orgId,
        },
      ),
    );
  }
}
