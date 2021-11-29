import 'package:flutter_web/app/domain/contracts/repositories/auth_repository.dart';
import 'package:flutter_web/app/domain/usecases/auth_usecases_implementation.dart';
import 'package:flutter_web/app/domain/usecases/interfaces/auth_usecases.dart';


import 'package:flutter_web/app/infra/repository/auth_repository_implementation.dart';
import 'package:flutter_web/app/infra/services/auth/service_auth.dart';
import 'package:flutter_web/app/infra/services/auth/service_auth_impl.dart';
import 'package:flutter_web/app/presenter/sign_in/sing_in_controller.dart';
import 'package:flutter_web/app/presenter/sign_in/interface/sign_controller_interface.dart';
import 'package:get/get.dart';

class SingInBinding implements Bindings {
  @override
  void dependencies() {   

    Get.lazyPut<AuthUsecases>(() => AuthUsecasesImplementation());

    Get.lazyPut<AuthRepository>(() => AuthRepositoryImplementation(Get.find()));

    Get.lazyPut<ServiceAuth>(
        () => ServiceAuthImpl(datasource: Get.find(), repository: Get.find()));

    Get.lazyPut<SignControllerInterface>(
      () => SingInController(Get.find()),
    );
  }
}
