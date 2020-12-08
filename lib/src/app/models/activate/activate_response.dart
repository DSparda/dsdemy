class ActivateResponse {
  int active;
  String createdAt;
  String sId;
  String name;
  String email;
  String password;
  String phone;
  String role;
  String image;
  String gender;
  int iV;
  String activeToken;

  ActivateResponse(
      {this.active,
      this.createdAt,
      this.sId,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.role,
      this.image,
      this.gender,
      this.iV,
      this.activeToken});

  ActivateResponse.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    role = json['role'];
    image = json['image'];
    gender = json['gender'];
    iV = json['__v'];
    activeToken = json['activeToken'];
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
    data['role'] = this.role;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    data['activeToken'] = this.activeToken;
    return data;
  }
}
