import 'package:get/get.dart';
import 'package:hyah_karima/data/internal/user_login_data.dart';

class DrawerWidgetController extends GetxController {
  static DrawerWidgetController get to => Get.find<DrawerWidgetController>();
  static DrawerWidgetController get put =>
      Get.put<DrawerWidgetController>(DrawerWidgetController());

  @override
  void onInit() {
    super.onInit();
    name.value =
        UserAuthLoginData.instance.getAuthModelIfFound()?.client?.userName ??
            "";
  }

  RxString name = "".obs;
}
