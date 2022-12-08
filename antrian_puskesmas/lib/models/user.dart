class User {
  late String username, password, email;
  User(String username, String password, String email) {
    this.username = username;
    this.password = password;
    this.email = email;
  }
  //objek to map conversion
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = new Map();
    map['username'] = username;
    map['password'] = password;
    map['email'] = email;
    return map;
  }

  //map to object conversion
  User.fromMap(Map<String, dynamic> map) {
    this.username = map['username'];
    this.password = map['password'];
    this.email = map['email'];
  }
}
