import 'dart:convert';
import 'package:get/get.dart';
import 'package:munchkin/models/player.dart';

class Room {
  Room({
    required this.id,
    required this.name,
    required this.password,
  });

  final String id;
  final String name;
  final String password;
  final RxList<Player> players = RxList();

  void createPlayer(String name, int gender) {
    Player player = Player(name: name, gender: gender);
    players.add(player);
  }

  List<String> playersToJson() {
    List<String> serializedPlayers = [];
    for (Player player in players) {
      serializedPlayers.add(jsonEncode(player));
    }
    return serializedPlayers;
  }
}
