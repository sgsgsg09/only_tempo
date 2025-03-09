import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:only_tempo/lib/features/models/tempo.dart';

/// TempoRepository: Tempo 데이터를 관리하는 클래스
class TempoRepository {
  static const String _storageKey = 'tempoModel';
  SharedPreferences? _prefs;

  /// SharedPreferences 초기화
  Future<void> _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  /// Tempo 데이터 로드
  ///
  /// SharedPreferences에서 저장된 TempoModel 데이터를 불러옵니다.
  /// 저장된 데이터가 없을 경우 기본 TempoModel을 반환합니다.
  Future<TempoModel> loadTempo() async {
    await _initPrefs();
    final storedData = _prefs?.getString(_storageKey);

    if (storedData != null) {
      try {
        final jsonData = jsonDecode(storedData);
        return TempoModel.fromJson(jsonData);
      } catch (e) {
        // 데이터가 잘못된 형식으로 저장된 경우 기본값 반환
        return _defaultTempo();
      }
    } else {
      // 저장된 데이터가 없을 경우 기본값 반환
      return _defaultTempo();
    }
  }

  /// Tempo 데이터 저장
  ///
  /// SharedPreferences에 TempoModel 데이터를 저장합니다.
  Future<void> saveTempo(TempoModel tempo) async {
    await _initPrefs();
    try {
      final jsonData = jsonEncode(tempo.toJson());
      await _prefs?.setString(_storageKey, jsonData);
    } catch (e) {
      throw Exception('Failed to save TempoModel: $e');
    }
  }

  /// 기본 TempoModel 반환
  TempoModel _defaultTempo() {
    return TempoModel(
      groupNumber: 1,
      soundPath: 'assets/sounds/example',
      imagePath: 'path/to/default/image',
      elements: [
        GroupElement(id: 1, sound: 'default', volume: 50, bpm: 60),
      ],
    );
  }
}
