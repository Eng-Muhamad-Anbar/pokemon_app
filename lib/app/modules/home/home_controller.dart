import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController textField = TextEditingController();

  void upDateText(String val) {
    textField.text = val;
    update(["text"]);
  }

  void clearText() {
    textField.clear();
    update(["textfield", "text"]);
  }
}
