import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:musicmate/bindings/generalbinding.dart';
import 'package:musicmate/core/local/changelocale.dart';
import 'package:musicmate/core/services/services.dart';
import 'package:audio_service/audio_service.dart';
import 'package:musicmate/core/utilities/audio_handler.dart';
import 'package:musicmate/core/utilities/global_var.dart';

import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        // statusBarColor: currentColorScheme.background,
        ),
  );
  audioHandler = await AudioService.init(
      builder: () => AntiiqAudioHandler(),
      config: const AudioServiceConfig(
        androidNotificationChannelId: "com.coleblvck.antiiq.channel.audio",
        androidNotificationChannelName: "Antiiq Player",
        androidNotificationIcon: "drawable/antiiq_icon",
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalLanguage controller = Get.put(LocalLanguage());

    return GetMaterialApp(
      title: 'Music Mate',
      debugShowCheckedModeBanner: false,
      getPages: routes,
      initialBinding: IntialBindings(),
      theme: controller.appTheme,
      locale: controller.language,
      darkTheme: ThemeData.dark(),
      fallbackLocale: Locale(Get.deviceLocale!.languageCode),
    );
  }
}
