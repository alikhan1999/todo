import 'package:flutter/foundation.dart';

@immutable
abstract class ITTSService{
  Future speak(String text);
  Future pause();
  Future stop();
  Future setLanguage({String lang});
  Future setVolume({double volume});
  Future setSpeechRate({double rate });
}