class Player {
  Player({required this.name, this.level = 1, required this.gender, this.power = 0});

  int gender;
  int level;
  String name;
  int power;

  Player.fromJson(Map<String, dynamic> json)
      : gender = json['gender'],
        level = json['level'],
        name = json['name'],
        power = json['power'];

  Map<String, dynamic> toJson() => {
        'gender': gender,
        'level': level,
        'name': name,
        'power': power,
      };
}
