class UpdateProfileRequest {
  String name;
  String description;
  String phone;
  String address;
  String gender;

  UpdateProfileRequest(
      {this.name, this.description, this.phone, this.address, this.gender});

  UpdateProfileRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    phone = json['phone'];
    address = json['address'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['gender'] = this.gender;
    return data;
  }
}
