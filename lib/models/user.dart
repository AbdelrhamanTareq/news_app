class User {
  String email;
  String password;
  String username;
  String phone;
  String imageUrl;
  String token;
  String id;

  User(
      {this.email,
      this.password,
      this.username,
      this.phone,
      this.imageUrl,
      this.token,
      this.id});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    phone = json['phone'];
    imageUrl = json['imageUrl'];
    token = json['token'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['username'] = this.username;
    data['phone'] = this.phone;
    data['imageUrl'] = this.imageUrl;
    data['token'] = this.token;
    data['id'] = this.id;
    return data;
  }
}
