import 'package:examen_practic_sim/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:examen_practic_sim/preferences/preferences.dart';

class Controller extends GetxController {
  GlobalKey<FormState> formLoginKey = GlobalKey<FormState>();
  RxBool checkbox = Preferences.checkbox.obs;
  Rx<User> tempUser = Preferences.user.obs;

  void changeCheckbox(bool value) {
    checkbox.value = value;
    Preferences.checkbox = value;
  }

  void persistirUsuari() {
    if (checkbox.value == true) {
      Preferences.user = tempUser.value;
    } else {
      Preferences.user = User(email: '', password: '');
    }
  }
}
