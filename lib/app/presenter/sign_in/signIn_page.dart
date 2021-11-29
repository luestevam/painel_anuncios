import 'package:flutter/material.dart';
import 'package:flutter_web/app/core/themes/theme_color.dart';
import 'package:flutter_web/app/presenter/components/custom_textfiled.dart';
import 'package:get/get.dart';
import 'interface/sign_controller_interface.dart';

class SignInPage extends GetView<SignControllerInterface> {
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    return Container(
      color: ThemesColor.thirdColorWhite,
      child: Stack(
        children: [
          Positioned(
              child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: widthScreen,
                  height: heightScreen * 0.5,
                  color: ThemesColor.thirdColorWhite,
                ),
              ),
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        width: 500,
                        child: Column(
                          children: [
                            Obx(() => Visibility(
                                  visible: controller.isSigUp.value,
                                  child: ClipOval(
                                    child: Image.asset(
                                      'assets/images/perfil.png',
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(() => Visibility(
                                  visible: controller.isSigUp.value,
                                  child: OutlinedButton(
                                    onPressed: () {},
                                    child: Text('Selecionar foto'),
                                  ),
                                )),
                            SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Obx(() => Visibility(
                                  visible: controller.isSigUp.value,
                                  child: CustomTextField(
                                    controllerEmail: controller.controllerName,
                                    icon: Icons.person_off_outlined,
                                    hintText: 'Nome Completo',
                                    labelText: 'Nome Completo',
                                  ),
                                )),
                            CustomTextField(
                              controllerEmail: controller.controllerEmail,
                              icon: Icons.email,
                              hintText: 'Email',
                              labelText: 'Email',
                            ),
                            CustomTextField(
                              controllerEmail: controller.controllerPassword,
                              icon: Icons.lock_clock_outlined,
                              hintText: 'Senha',
                              labelText: 'Senha',
                              obscureText: true,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Obx(() => Visibility(
                                      visible: controller.visibility.value,
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Recuperar senha',
                                          style: TextStyle(
                                              color:
                                                  ThemesColor.primaryColorGreen,
                                              fontSize: 12),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              children: [
                                ElevatedButton(
                                  onPressed: controller.authOrRegistry,
                                  style: ElevatedButton.styleFrom(
                                      primary: ThemesColor.primaryColorGreen),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ),
                                Obx(() => Row(
                                      children: [
                                        Text('Entrar'),
                                        Switch(
                                            value: controller.isSigUp.value,
                                            onChanged: controller.isRegister),
                                        Text('Cadastrar'),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
