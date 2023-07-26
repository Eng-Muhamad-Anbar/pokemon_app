import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            GetBuilder<HomeController>(
                id: "textfield",
                builder: (_) {
                  return TextField(
                    decoration:
                        const InputDecoration(hintText: "Enter your name"),
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                          text: controller.textField.text,
                          selection: TextSelection(
                            baseOffset: controller.textField.text.length,
                            extentOffset: controller.textField.text.length,
                          )),
                    ),
                    onChanged: (value) {
                      controller.upDateText(value);
                    },
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            GetBuilder<HomeController>(
                id: "text",
                builder: (_) {
                  return Center(
                    child: Text(
                      controller.textField.text,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  );
                }),
            const SizedBox(
              height: 380,
            ),
            TextButton.icon(
                onPressed: () {
                  controller.clearText();
                },
                icon: const Icon(
                  Icons.restore_from_trash_rounded,
                  color: Color.fromARGB(255, 224, 10, 10),
                ),
                label: const Text(
                  "Clear text",
                  style: TextStyle(color: Color.fromARGB(255, 224, 10, 10)),
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  "/animations",
                  arguments: controller.textField.text,
                );
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                fixedSize: const Size.fromHeight(50),
                backgroundColor: Colors.blue[900],
              ),
              child: const Text("Go to page 1"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/pokemons");
              },
              style: ElevatedButton.styleFrom(
                fixedSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: Colors.lightBlueAccent[100],
              ),
              child: const Text("Go to page 2"),
            ),
          ],
        ),
      ),
    );
  }
}
