import 'package:e_comm/features/admin_panel/controller/admin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';

class AdminPass extends StatelessWidget {
  const AdminPass({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> Get.back(), icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 200,
              ),
              const Text(
                'ادخل كلمة المرور',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  expands: false,
                  obscureText: controller.hidePass.value,
                  validator: (value) =>
                      TValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePass.value =
                              !controller.hidePass.value,
                          icon: Icon(controller.hidePass.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                      labelText: TTexts.password),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: const Text('دخول'),
                  onPressed: () => controller.signUpAdmin(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
