import 'package:flutter_tts/flutter_tts.dart';

import '../../common/logger/log.dart';
import 'i_tts_service.dart';

class TTSService implements ITTSService {
  late final FlutterTts flutterTts;

  TTSService(this.flutterTts) {
    setIosConfigs();
  }

  setIosConfigs() async {
    await flutterTts.setIosAudioCategory(
        IosTextToSpeechAudioCategory.ambient,
        [
          IosTextToSpeechAudioCategoryOptions.allowBluetooth,
          IosTextToSpeechAudioCategoryOptions.allowBluetoothA2DP,
          IosTextToSpeechAudioCategoryOptions.mixWithOthers,
          IosTextToSpeechAudioCategoryOptions.defaultToSpeaker
        ],
        IosTextToSpeechAudioMode.spokenAudio);
  }

  @override
  Future pause() async {
    d("PAUSE");
    flutterTts.pause();
  }

  @override
  Future setSpeechRate({double rate = 0.4}) {
    return flutterTts.setSpeechRate(rate);
  }

  @override
  Future speak(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      d("TTS SPEAK FAILURE $e");
    }
  }

  @override
  Future stop() {
    return flutterTts.stop();
  }

  @override
  Future setLanguage({String lang = "en-US"}) {
    ///french fr-FR
    return flutterTts.setLanguage(lang);
  }

  @override
  Future setVolume({double volume = 1.0}) async {
    assert(volume <= 1 || volume <= 0);
    await flutterTts.setVoice({"name": "Martha", "locale": "en-GB"});
    return flutterTts.setVolume(volume);
  }
}
