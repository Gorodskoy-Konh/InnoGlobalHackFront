// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      id: json['id'] as String,
      workingSchedule: (json['workingSchedule'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  $jsonValue[r'$1'] as int,
                  $jsonValue[r'$2'] as int,
                ),
              ))
          .toList(),
      stack: (json['stack'] as List<dynamic>)
          .map((e) => $enumDecode(_$StackEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workingSchedule': instance.workingSchedule
          .map((e) => {
                r'$1': e.$1,
                r'$2': e.$2,
              })
          .toList(),
      'stack': instance.stack.map((e) => _$StackEnumMap[e]!).toList(),
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

const _$StackEnumMap = {
  Stack.cpp: 'cpp',
  Stack.python: 'python',
  Stack.backend: 'backend',
  Stack.frontend: 'frontend',
  Stack.react: 'react',
};
