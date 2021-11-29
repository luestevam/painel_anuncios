import 'package:flutter/material.dart';
import 'package:flutter_web/app/domain/contracts/gateways/logger_interface.dart';
import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';
import 'package:flutter_web/app/infra/services/auth/service_auth.dart';
import 'package:flutter_web/app/presenter/sign_in/interface/sign_controller_interface.dart';
import 'package:get/get.dart';

class SingInController extends GetxController
    implements SignControllerInterface {
  final ServiceAuth repository;

  SingInController(this.repository);

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  final isSigUp = false.obs;
  final visibility = true.obs;

  @override
  void isRegister(bool value) {
    isSigUp(value);
  }

  @override
  set isSigUp(RxBool _sigUp) {
    isSigUp.value = _sigUp.value;
  }

  @override
  set visibility(RxBool _visibility) {
    visibility.value = _visibility.value;
  }

  Future<void> authOrRegistry() async {
    if (isSigUp.value) {
      final result = await repository.registre(CredentialParamsLogin(
          email: 'carlos_cdm@live.com',
          password:'',
          name: ''));

      if (result.isRight) {
        Get.find<ILogger>().info(result.right.toString());
      } else {
        Get.find<ILogger>().info(result.left.toString());
      }
      
    } else {
      final result = await repository.auth(CredentialParamsLogin(
          email: 'carlos_cdm@live.com', password: '123456789'));

      if (result.isRight) {
        Get.find<ILogger>().info(result.right.toString());
      } else {
        Get.find<ILogger>().info(result.left.toString());
      }
    }
  }


 
}
