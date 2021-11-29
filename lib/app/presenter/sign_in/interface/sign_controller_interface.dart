import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignControllerInterface {
  late TextEditingController controllerName;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPassword;
  void authOrRegistry();
  late RxBool isSigUp;
  late RxBool visibility;
  void isRegister(bool value);
}
