import 'package:examen_practic_sim/controllers/user_service_controller.dart';
import 'package:get/get.dart';

import '../models/models.dart';

class UsersFirebaseController extends GetxController {
  final UserService userService = UserService();
  //RxList<UserFirebase> users = userService.users.obs;
}
