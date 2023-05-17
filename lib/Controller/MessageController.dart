import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MessageController extends GetxController {
  RxList objMessageController = [].obs;

  void updateObjMessageController(Map value) {
    objMessageController.add(value);
  }

}