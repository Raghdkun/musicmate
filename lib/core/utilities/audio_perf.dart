
import 'package:just_audio/just_audio.dart';
import 'package:musicmate/core/utilities/global_var.dart';
import 'package:musicmate/core/utilities/user_settings.dart';

setEqualizerEnabled(bool value) async {
  audioHandler.equalizer.setEnabled(value);
  await antiiqStore.put(BoxKeys().eqEnabledStorage, value);
}

getEqualizerEnabled() async {
  final bool enabled =
      await antiiqStore.get(BoxKeys().eqEnabledStorage, defaultValue: false);
  audioHandler.equalizer.setEnabled(enabled);
}

saveBandFreqs() async {
  final params = await audioHandler.equalizer.parameters;
  List<double> bandFreqs = params.bands.map((e) => e.gain).toList();
  await antiiqStore.put(BoxKeys().bandFrequencyStorage, bandFreqs);
}

List bandFreqs = [];

getBandFreqs() async {
  bandFreqs =
      await antiiqStore.get(BoxKeys().bandFrequencyStorage, defaultValue: []);
}

setBands() async {
  final params = await audioHandler.equalizer.parameters;
  List<AndroidEqualizerBand> bands = params.bands;
  if (bandFreqs.isNotEmpty) {
    for (var band in bands) {
      band.setGain(bandFreqs[bands.indexOf(band)]);
    }
  }
  bandsSet = true;
}

bool bandsSet = false;

updateShuffleMode(bool mode) async {
  await audioHandler.audioPlayer.setShuffleModeEnabled(mode);
  await antiiqStore.put(BoxKeys().shuffleModeStorage, mode);
  if (mode) {
    updateLoopMode(LoopMode.all);
  }
}

updateLoopMode(LoopMode mode) async {
  await audioHandler.audioPlayer.setLoopMode(mode);
  if (mode == LoopMode.one) {
    await antiiqStore.put(BoxKeys().loopModeStorage, "one");
  } else if (mode == LoopMode.all) {
    await antiiqStore.put(BoxKeys().loopModeStorage, "all");
  } else if (mode == LoopMode.off) {
    await antiiqStore.put(BoxKeys().loopModeStorage, "off");
  }
}

getAndSetShuffleMode() async {
  bool shuffleMode =
      await antiiqStore.get(BoxKeys().shuffleModeStorage, defaultValue: false);
  await audioHandler.audioPlayer.setShuffleModeEnabled(shuffleMode);
}

getAndSetLoopMode() async {
  String mode =
      await antiiqStore.get(BoxKeys().loopModeStorage, defaultValue: "off");
  await setLoopMode(mode);
}

setLoopMode(String mode) async {
  LoopMode modeToSet = LoopMode.off;
  if (mode == "all") {
    modeToSet = LoopMode.all;
  } else if (mode == "one") {
    modeToSet = LoopMode.one;
  }
  await audioHandler.audioPlayer.setLoopMode(modeToSet);
}