import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'animations_controller.dart';

class AnimationsView extends GetView<AnimationsController> {
  const AnimationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animations"),
        ),
        body: ListView(children: [
          const SizedBox(
            height: 50,
          ),
          Center(
              child: Text(
            controller.myName,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          )),
          const SizedBox(
            height: 75,
          ),
          GetBuilder<AnimationsController>(
              id: "Animation",
              builder: (_) {
                return Center(
                  child: AnimatedContainer(
                    height: controller.height,
                    width: controller.width,
                    decoration: BoxDecoration(
                        borderRadius: controller.borderRadius,
                        color: controller.color),
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                  ),
                );
              }),
          const SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  controller.applyAnimation(
                      color: Colors.blue[900], borderRadius: BorderRadius.zero);
                },
                child: Container(
                  height: 65,
                  width: 65,
                  color: Colors.blue[900],
                ),
              ),
              InkWell(
                onTap: () {
                  controller.applyAnimation(
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(50));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(15)),
                  height: 65,
                  width: 65,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.applyAnimation(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(175));
                },
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          )
        ]));
  }
}
