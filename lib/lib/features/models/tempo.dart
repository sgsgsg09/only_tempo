import 'package:freezed_annotation/freezed_annotation.dart';

part 'tempo.freezed.dart';
part 'tempo.g.dart';

@freezed
class TempoModel with _$TempoModel {
  const factory TempoModel({
    @Default(0) int groupNumber,
    @Default('assets/sounds/ambient_c_motion.mp3') String soundPath,
    @Default('path/to/default/image') String imagePath,
    @Default(<GroupElement>[]) List<GroupElement> elements,
  }) = _TempoModel;

  //Json 데이터를 Dart 객체로 변환
  factory TempoModel.fromJson(Map<String, dynamic> json) =>
      _$TempoModelFromJson(json);
}

@freezed
class GroupElement with _$GroupElement {
  const factory GroupElement({
    required int id,
    required String sound,
    @Default(50) int volume, // 기본 볼륨을 100으로 설정
    @Default(60) int bpm, // 기본 BPM을 120으로 설정
  }) = _GroupElement;

  factory GroupElement.fromJson(Map<String, dynamic> json) =>
      _$GroupElementFromJson(json);
}
