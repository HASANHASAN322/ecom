import 'package:e_comm/features/shop/controllers/product/variation_controller.dart';
import 'package:e_comm/utils/network_connection/network_connection.dart';
import 'package:get/get.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }
}
