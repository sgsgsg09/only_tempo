import 'package:only_tempo/lib/features/models/tempo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'metronome_notifier.g.dart';

//volume, bpm 구독하기.
@riverpod
class metronomeNotifier extends _$metronomeNotifier {
  AudioPlayer? audioPlayer;
  bool isPlaying = false;

  @override
  TempoModel? build() {
    return null;
  }

  /// 새로운 템포를 업데이트하고 오디오를 설정 및 재생하는 메서드
  void updateTempo(TempoModel tempo, {double speed = 1.0}) async {
    // 기존 재생 중인 오디오 중지
    await audioPlayer?.stop();

    // 새로운 AudioPlayer 인스턴스 생성
    audioPlayer = AudioPlayer();

    // 오디오 소스 설정
    final audioSource = AudioSource.uri(Uri.parse(tempo.soundPath));
    await audioPlayer!.setAudioSource(audioSource);

    // 반복 모드 및 재생 속도 설정
    await _configurePlayback(speed);

    // 상태 업데이트
    isPlaying = true;
    state = tempo;
  }

  /// 재생/일시정지 상태를 전환하는 메서드
  void togglePlayPause() {
    if (isPlaying) {
      audioPlayer?.pause();
    } else {
      audioPlayer?.play();
    }
    isPlaying = !isPlaying;
    // 상태가 변경되었음을 알리기 위해 상태를 재설정
    state = state;
  }

  /// 재생 속도 및 반복 모드를 설정하는 헬퍼 메서드
  Future<void> _configurePlayback(double speed) async {
    if (audioPlayer != null) {
      audioPlayer!.setLoopMode(LoopMode.one); // 반복 모드 설정
      audioPlayer!.setSpeed(speed); // 재생 속도 설정
      await audioPlayer!.play();
    }
  }
}
