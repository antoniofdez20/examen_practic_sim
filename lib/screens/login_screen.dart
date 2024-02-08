import 'package:examen_practic_sim/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    final tempUser = controller.tempUser;

    //el gesturedetector nos va a permitir que si el usuario toca en cualquier parte de la pantalla que no sean los campos de texto el teclado se escondera
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Examen Simulacro'),
        ),
        //SafeArea nos permite que el contenido de la pantalla no se superponga con el notch de las diferentes pantallas, los diferentes bordes que puedan tener, etc
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: controller.formLoginKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 35),
                      child: Text('Benvingut',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold)),
                    ),
                    Obx(
                      () => TextFormField(
                        initialValue: tempUser.value.email,
                        onChanged: (value) => tempUser.update((val) {
                          val!.email = value;
                        }),
                        style: const TextStyle(color: Color(0xFFFFC300)),
                        cursorColor: const Color(0xFFFFC300),
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFFFC300)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF001D3D),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFFC300),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          filled: true,
                          fillColor: Color(0xFF001D3D),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => TextFormField(
                        initialValue: tempUser.value.password,
                        onChanged: (value) => tempUser.update((val) {
                          val!.password = value;
                        }),
                        style: const TextStyle(color: Color(0xFFFFC300)),
                        cursorColor: const Color(0xFFFFC300),
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contrasenya',
                          labelStyle: const TextStyle(color: Color(0xFFFFC300)),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF001D3D),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFFFFC300),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF001D3D),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Vols guardar les dades?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Obx(
                            () => Checkbox(
                                checkColor: Colors.white,
                                value: controller.checkbox.value,
                                onChanged: (bool? value) {
                                  controller.changeCheckbox(value!);
                                }),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        backgroundColor: const Color(0xFFFFC300),
                        foregroundColor: const Color(0xFF001D3D),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () async {
                        // Lógica de inicio de sesión aquí
                        if (controller.formLoginKey.currentState!.validate()) {
                          controller.persistirUsuari();
                        }
                        Get.offNamed('/home');
                      },
                      child: const Text('Iniciar Sessió'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
