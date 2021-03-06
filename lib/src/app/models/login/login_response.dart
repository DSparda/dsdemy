class LoginResponse {
  int active;
  String createdAt;
  String sId;
  String name;
  String email;
  String password;
  String phone;
  String address;
  String description;
  String role;
  String image;
  String gender;
  int iV;
  String activeToken;
  String resetPasswordRoken;

  LoginResponse(
      {this.active,
      this.createdAt,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.description,
      this.role,
      this.image,
      this.gender,
      this.iV,
      this.activeToken,
      this.resetPasswordRoken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    description = json['description'];
    role = json['role'];
    image = json['image'];
    gender = json['gender'];
    iV = json['__v'];
    activeToken = json['activeToken'];
    resetPasswordRoken = json['resetPasswordRoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['description'] = this.description;
    data['role'] = this.role;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    data['activeToken'] = this.activeToken;
    data['resetPasswordRoken'] = this.resetPasswordRoken;
    return data;
  }
}
