import 'package:get/get.dart';
import 'package:musicmate/controllers/player/player_controller.dart';
import 'package:musicmate/core/constant/approutes.dart';
import 'package:musicmate/core/services/services.dart';

class SplashScreenController extends GetxController {
  MyServices myServices = Get.find() ; 
  final  PlayerController playerController = Get.put(PlayerController());

  void onNext() async {
    await Future.delayed(const Duration(seconds: 2));

    Get.offAllNamed(AppRoute.main); 
    playerController.fetchSongs(); 
  }

  @override
  void onInit() async {
   

    

    onNext();
    super.onInit();
  }
}
