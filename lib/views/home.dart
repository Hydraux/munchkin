import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:munchkin/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Rooms'),
        ),
        floatingActionButton: SpeedDial(
          overlayOpacity: 0,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.group_add),
                label: 'Create',
                onTap: () => Get.dialog(Dialog(
                        child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Form(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Room Name',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () =>
                                        controller.createRoom(nameController.text, passwordController.text),
                                    child: const Text('Create'),
                                  ),
                                  const Spacer(
                                    flex: 1,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text('Cancel')),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )))),
            SpeedDialChild(
              child: const Icon(Icons.group),
              label: 'Join',
              onTap: () {
                Get.dialog(Dialog(
                    child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Form(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Room Name',
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Password',
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Row(
                            children: [
                              ElevatedButton(onPressed: () {}, child: const Text('Join')),
                              const Spacer(
                                flex: 1,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text('Cancel')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )));
              },
            )
          ],
        ),
        body: getRooms());
  }

  Widget getRooms() {
    if (controller.numRooms == 0) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Press',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Icon(
              Icons.menu,
              size: 50,
              color: Colors.white,
            ),
            Text(
              'To Create/Join a room',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
          ],
        ),
      );
    } else {
      return const Text('There should be rooms');
    }
  }
}
