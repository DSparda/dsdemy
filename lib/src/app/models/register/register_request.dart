class RegisterRequest {
  String name;
  String email;
  String phone;
  String password;
  String gender;

  RegisterRequest(
      {this.name, this.email, this.phone, this.password, this.gender});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['gender'] = this.gender;
    return data;
  }
}