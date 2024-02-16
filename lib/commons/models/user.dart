class User {
  int? userID;
  String userName;
  String? lastName;
  String? pass;
  bool? active;
  String? photo;

  User({required this.userName, this.pass, this.active, this.lastName, this.photo, this.userID});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userID: json['userID'],
        userName: json['userName'],
        lastName: json['lastName'],
        photo: json['photo'],
        active: json['active'] ?? false
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = userName;
    data['pass'] = pass;
    return data;
  }
}
