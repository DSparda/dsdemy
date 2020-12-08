class ActivateRequest {
  String email;
  String activeToken;

  ActivateRequest({this.email, this.activeToken});

  ActivateRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    activeToken = json['activeToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['activeToken'] = this.activeToken;
    return data;
  }
}
