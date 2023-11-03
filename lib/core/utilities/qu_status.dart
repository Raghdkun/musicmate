
import 'package:audio_service/audio_service.dart';
import 'package:musicmate/core/utilities/file_handling.dart/lists.dart';
import 'package:musicmate/core/utilities/file_handling.dart/metadata.dart';
import 'package:musicmate/core/utilities/global_var.dart';
import 'package:musicmate/core/utilities/user_settings.dart';

saveQueueState() async {
  List<int> stateToSave =
      activeQueue.map((item) => item.extras!["id"]).toList().cast();
  await antiiqStore.put(BoxKeys().queueState, stateToSave);
}

initQueueState() async {
  List<MediaItem> queueToInit = [];
  List<int> stateToInit =
      await antiiqStore.get(BoxKeys().queueState, defaultValue: <int>[]);
  for (int id in stateToInit) {
    for (Track track in currentTrackListSort) {
      if (track.trackData!.trackId == id) {
        queueToInit.add(track.mediaItem!);
      }
    }
  }
  queueState = queueToInit;
}