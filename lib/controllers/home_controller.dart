import 'package:get/get.dart';
import 'package:munchkin/models/room.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeController extends GetxController {
  RxList<Room> rooms = RxList();
  FirebaseDatabase instance = FirebaseDatabase.instance;
  int get numRooms => rooms.length;

  void createRoom(String name, String password) {
    Room room = Room(
      id: DateTime.now().toString(),
      name: name,
      password: password,
    );

    //rooms.add(room);
    uploadRoom(room);
  }

  Future<void> uploadRoom(Room room) {
    return instance.ref(room.id).set({
      'name': room.name,
      'password': room.password,
      'players': room.playersToJson(),
    });
  }
}
