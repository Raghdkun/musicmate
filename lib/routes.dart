import 'package:get/get.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/views/home.dart';
import 'package:musicmate/views/player.dart';
import 'package:musicmate/views/playlists.dart';
import 'package:musicmate/views/splash/splash.dart';
import 'package:musicmate/views/tabviewmain.dart';

List<GetPage<dynamic>>? routes = [
  // auth path
  GetPage(
      name: AppRoute.home,
      page: () => const Home(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
      name: AppRoute.splash,
      page: () => const SplashScreen(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
      name: AppRoute.player,
      page: () => const Player(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
      name: AppRoute.main,
      page: () =>  MainTabView(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
      GetPage(
      name: AppRoute.addplaylist,
      page: () =>  AddPlaylist(),
      // middlewares: [MyMiddleWare()],
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500)),
];