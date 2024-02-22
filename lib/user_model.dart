class User {
  int? id;
  String name;
  String number;
  String gender;

  User({this.id, required this.name, required this.number, required this.gender});

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'gender': gender,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, number: $number, gender: $gender}';
  }
}
