// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tempo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TempoModelImpl _$$TempoModelImplFromJson(Map<String, dynamic> json) =>
    _$TempoModelImpl(
      groupNumber: (json['groupNumber'] as num?)?.toInt() ?? 0,
      soundPath:
          json['soundPath'] as String? ?? 'assets/sounds/ambient_c_motion.mp3',
      imagePath: json['imagePath'] as String? ?? 'path/to/default/image',
      elements: (json['elements'] as List<dynamic>?)
              ?.map((e) => GroupElement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <GroupElement>[],
    );

Map<String, dynamic> _$$TempoModelImplToJson(_$TempoModelImpl instance) =>
    <String, dynamic>{
      'groupNumber': instance.groupNumber,
      'soundPath': instance.soundPath,
      'imagePath': instance.imagePath,
      'elements': instance.elements,
    };

_$GroupElementImpl _$$GroupElementImplFromJson(Map<String, dynamic> json) =>
    _$GroupElementImpl(
      id: (json['id'] as num).toInt(),
      sound: json['sound'] as String,
      volume: (json['volume'] as num?)?.toInt() ?? 50,
      bpm: (json['bpm'] as num?)?.toInt() ?? 60,
    );

Map<String, dynamic> _$$GroupElementImplToJson(_$GroupElementImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sound': instance.sound,
      'volume': instance.volume,
      'bpm': instance.bpm,
    };
