class CategoryResponse {
  String? message;
  String? code;
  List<Categories>? categories;

  CategoryResponse({this.message, this.code, this.categories});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? skillId;
  String? skillName;
  String? skillImage;
  String? job;
  String? user;
  int? numberofuser;

  Categories(
      {this.skillId,
        this.skillName,
        this.skillImage,
        this.job,
        this.user,
        this.numberofuser});

  Categories.fromJson(Map<String, dynamic> json) {
    skillId = json['skill_id'];
    skillName = json['skill_name'];
    skillImage = json['skill_image'];
    job = json['job'];
    user = json['user'];
    numberofuser = json['numberofuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill_id'] = this.skillId;
    data['skill_name'] = this.skillName;
    data['skill_image'] = this.skillImage;
    data['job'] = this.job;
    data['user'] = this.user;
    data['numberofuser'] = this.numberofuser;
    return data;
  }
}
