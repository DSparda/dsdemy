class CourseResponse {
  Vote vote;
  int discount;
  int ranking;
  String createdAt;
  int isChecked;
  bool isRequired;
  String sId;
  String name;
  IdUser idUser;
  String image;
  String goal;
  String description;
  IdUser category;
  int price;
  int iV;

  CourseResponse(
      {this.vote,
      this.discount,
      this.ranking,
      this.createdAt,
      this.isChecked,
      this.isRequired,
      this.sId,
      this.name,
      this.idUser,
      this.image,
      this.goal,
      this.description,
      this.category,
      this.price,
      this.iV});

  CourseResponse.fromJson(Map<String, dynamic> json) {
    vote = json['vote'] != null ? new Vote.fromJson(json['vote']) : null;
    discount = json['discount'];
    ranking = json['ranking'];
    createdAt = json['created_at'];
    isChecked = json['is_checked'];
    isRequired = json['is_required'];
    sId = json['_id'];
    name = json['name'];
    idUser =
        json['idUser'] != null ? new IdUser.fromJson(json['idUser']) : null;
    image = json['image'];
    goal = json['goal'];
    description = json['description'];
    category =
        json['category'] != null ? new IdUser.fromJson(json['category']) : null;
    price = json['price'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.vote != null) {
      data['vote'] = this.vote.toJson();
    }
    data['discount'] = this.discount;
    data['ranking'] = this.ranking;
    data['created_at'] = this.createdAt;
    data['is_checked'] = this.isChecked;
    data['is_required'] = this.isRequired;
    data['_id'] = this.sId;
    data['name'] = this.name;
    if (this.idUser != null) {
      data['idUser'] = this.idUser.toJson();
    }
    data['image'] = this.image;
    data['goal'] = this.goal;
    data['description'] = this.description;
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['price'] = this.price;
    data['__v'] = this.iV;
    return data;
  }
}

class Vote {
  int totalVote;
  int eVGVote;

  Vote({this.totalVote, this.eVGVote});

  Vote.fromJson(Map<String, dynamic> json) {
    totalVote = json['totalVote'];
    eVGVote = json['EVGVote'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalVote'] = this.totalVote;
    data['EVGVote'] = this.eVGVote;
    return data;
  }
}

class IdUser {
  String sId;
  String name;

  IdUser({this.sId, this.name});

  IdUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}
