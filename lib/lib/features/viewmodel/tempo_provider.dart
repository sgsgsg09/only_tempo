import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:only_tempo/lib/core/providers/metronome_notifier.dart';
import 'package:only_tempo/lib/features/models/tempo.dart';
import 'package:only_tempo/lib/features/repositories/tempo_repository.dart';

// StateNotifierProvider 정의
final tempoModelProvider =
    StateNotifierProvider<TempoModelNotifier, TempoModel>((ref) {
  final repository = TempoRepository();
  return TempoModelNotifier(repository)..loadFromRepository();
});

class TempoModelNotifier extends StateNotifier<TempoModel> {
  final TempoRepository _repository;

  TempoModelNotifier(this._repository) : super(const TempoModel());

  // 데이터 로드
  Future<void> loadFromRepository() async {
    final tempo = await _repository.loadTempo();
    state = tempo;
  }

  // 데이터 저장
  Future<void> saveToRepository() async {
    await _repository.saveTempo(state);
  }

  // BPM 증가
  void increaseBpm(int id) {
    state = state.copyWith(
      elements: state.elements.map((element) {
        if (element.id == id && element.bpm < 240) {
          return element.copyWith(bpm: element.bpm + 1);
        }
        return element;
      }).toList(),
    );

    saveToRepository();
  }

  // BPM 감소
  void decreaseBpm(int id) {
    state = state.copyWith(
      elements: state.elements.map((element) {
        if (element.id == id && element.bpm > 30) {
          return element.copyWith(bpm: element.bpm - 1);
        }
        return element;
      }).toList(),
    );
    saveToRepository();
  }

  // 볼륨 업데이트
  void updateVolume(int id, int newVolume) {
    state = state.copyWith(
      elements: state.elements.map((element) {
        if (element.id == id && newVolume >= 0 && newVolume < 100) {
          return element.copyWith(volume: newVolume);
        }
        return element;
      }).toList(),
    );
    saveToRepository();
  }
}
