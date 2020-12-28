class UpdateProfileResponse {
  String status;
  User user;

  UpdateProfileResponse({this.status, this.user});

  UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int active;
  String createdAt;
  String sId;
  String email;
  String password;
  String role;
  String image;
  int iV;
  String activeToken;
  String resetPasswordRoken;

  User(
      {this.active,
      this.createdAt,
      this.sId,
      this.email,
      this.password,
      this.role,
      this.image,
      this.iV,
      this.activeToken,
      this.resetPasswordRoken});

  User.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    createdAt = json['created_at'];
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    image = json['image'];
    iV = json['__v'];
    activeToken = json['activeToken'];
    resetPasswordRoken = json['resetPasswordRoken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['image'] = this.image;
    data['__v'] = this.iV;
    data['activeToken'] = this.activeToken;
    data['resetPasswordRoken'] = this.resetPasswordRoken;
    return data;
  }
}
