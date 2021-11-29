import 'package:flutter_web/app/domain/contracts/gateways/http_client.dart';
import 'package:flutter_web/app/domain/contracts/gateways/logger_interface.dart';
import 'package:flutter_web/app/infra/data/datasource/api_datasource_implementation.dart';
import 'package:flutter_web/app/infra/data/datasource/interface/datasource.dart';
import 'package:flutter_web/app/infra/gateways/http_client_get_Connect.dart';
import 'package:flutter_web/app/infra/gateways/logger_implemetation.dart';
import 'package:get/get.dart';

class SharedServices implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut<Datasource>(
        () => ApiDatasourceImplementation(Get.find<HttpClient>()), fenix: true);
    Get.putAsync<ILogger>(() async => LoggerImplemetationDart().getInstance(), permanent: true);
    Get.putAsync<HttpClient>(() async => HttpClientGetConnect().getInstance(), permanent: true);
  }
}
