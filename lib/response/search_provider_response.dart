class SearchProvider {
  String? message;
  String? code;
  List<SearchData>? searchData;

  SearchProvider({this.message, this.code, this.searchData});

  SearchProvider.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['search_data'] != null) {
      searchData = <SearchData>[];
      json['search_data'].forEach((v) {
        searchData!.add(new SearchData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.searchData != null) {
      data['search_data'] = this.searchData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchData {
  int? id;
  String? name;
  String? phone;
  String? showNo;
  int? pincode;
  String? password;
  String? gender;
  String? confirmPass;
  String? skill;
  Null? otherSkills;
  String? type;
  String? verified;
  String? userType;
  String? email;
  String? status;
  String? location;
  String? city;
  String? state;
  String? country;
  String? address;
  Null? department;
  Null? subDepartment;
  String? fee;
  String? experience;
  String? companyAbout;
  Null? token;
  String? latitude;
  String? longitude;
  String? image;
  Null? profileBanner;
  String? regDate;
  String? updatedAt;
  String? agree;
  String? statusverification;
  String? dob;
  String? permAddress;
  String? zipCode;
  String? website;
  String? facebook;
  String? twitter;
  String? google;
  String? linkedin;
  String? description;
  int? isFeatured;
  int? isContractor;
  int? isPartner;
  Null? cardNumber;
  Null? cvCode;
  String? userStatus;
  String? textBody;
  Null? deviceToken;
  Null? expiryDate;
  String? createdAt;
  double? distan;

  SearchData(
      {this.id,
        this.name,
        this.phone,
        this.showNo,
        this.pincode,
        this.password,
        this.gender,
        this.confirmPass,
        this.skill,
        this.otherSkills,
        this.type,
        this.verified,
        this.userType,
        this.email,
        this.status,
        this.location,
        this.city,
        this.state,
        this.country,
        this.address,
        this.department,
        this.subDepartment,
        this.fee,
        this.experience,
        this.companyAbout,
        this.token,
        this.latitude,
        this.longitude,
        this.image,
        this.profileBanner,
        this.regDate,
        this.updatedAt,
        this.agree,
        this.statusverification,
        this.dob,
        this.permAddress,
        this.zipCode,
        this.website,
        this.facebook,
        this.twitter,
        this.google,
        this.linkedin,
        this.description,
        this.isFeatured,
        this.isContractor,
        this.isPartner,
        this.cardNumber,
        this.cvCode,
        this.userStatus,
        this.textBody,
        this.deviceToken,
        this.expiryDate,
        this.createdAt,
        this.distan});

  SearchData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    showNo = json['show_no'];
    pincode = json['pincode'];
    password = json['password'];
    gender = json['gender'];
    confirmPass = json['confirm_pass'];
    skill = json['skill'];
    otherSkills = json['other_skills'];
    type = json['type'];
    verified = json['verified'];
    userType = json['user_type'];
    email = json['email'];
    status = json['status'];
    location = json['location'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    address = json['address'];
    department = json['department'];
    subDepartment = json['sub_department'];
    fee = json['fee'];
    experience = json['experience'];
    companyAbout = json['companyAbout'];
    token = json['token'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    profileBanner = json['profile_banner'];
    regDate = json['reg_date'];
    updatedAt = json['updated_at'];
    agree = json['agree'];
    statusverification = json['statusverification'];
    dob = json['dob'];
    permAddress = json['perm_address'];
    zipCode = json['zip_code'];
    website = json['website'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    google = json['google'];
    linkedin = json['linkedin'];
    description = json['description'];
    isFeatured = json['is_featured'];
    isContractor = json['is_contractor'];
    isPartner = json['is_partner'];
    cardNumber = json['card_number'];
    cvCode = json['cv_code'];
    userStatus = json['user_status'];
    textBody = json['text_body'];
    deviceToken = json['device_token'];
    expiryDate = json['expiry_date'];
    createdAt = json['created_at'];
    distan = json['distan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['show_no'] = this.showNo;
    data['pincode'] = this.pincode;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['confirm_pass'] = this.confirmPass;
    data['skill'] = this.skill;
    data['other_skills'] = this.otherSkills;
    data['type'] = this.type;
    data['verified'] = this.verified;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['status'] = this.status;
    data['location'] = this.location;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['address'] = this.address;
    data['department'] = this.department;
    data['sub_department'] = this.subDepartment;
    data['fee'] = this.fee;
    data['experience'] = this.experience;
    data['companyAbout'] = this.companyAbout;
    data['token'] = this.token;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['image'] = this.image;
    data['profile_banner'] = this.profileBanner;
    data['reg_date'] = this.regDate;
    data['updated_at'] = this.updatedAt;
    data['agree'] = this.agree;
    data['statusverification'] = this.statusverification;
    data['dob'] = this.dob;
    data['perm_address'] = this.permAddress;
    data['zip_code'] = this.zipCode;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['google'] = this.google;
    data['linkedin'] = this.linkedin;
    data['description'] = this.description;
    data['is_featured'] = this.isFeatured;
    data['is_contractor'] = this.isContractor;
    data['is_partner'] = this.isPartner;
    data['card_number'] = this.cardNumber;
    data['cv_code'] = this.cvCode;
    data['user_status'] = this.userStatus;
    data['text_body'] = this.textBody;
    data['device_token'] = this.deviceToken;
    data['expiry_date'] = this.expiryDate;
    data['created_at'] = this.createdAt;
    data['distan'] = this.distan;
    return data;
  }
}
