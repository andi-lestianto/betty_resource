class UsersResponse {
  int? statusCode;
  String? status;
  String? message;
  User? data;

  UsersResponse({this.statusCode, this.status, this.message, this.data});

  UsersResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? User.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullName;
  String? phoneNumber;
  bool? isVerified;
  bool? isRegistrationCompleted;
  bool? isTermsAndPrivacyAgreed;
  String? lastLoggedIn;
  String? imageProfileUrl;
  String? createdAt;
  String? updatedAt;
  Tenant? tenant;

  User(
      {this.id,
      this.email,
      this.fullName,
      this.phoneNumber,
      this.isVerified,
      this.isRegistrationCompleted,
      this.isTermsAndPrivacyAgreed,
      this.lastLoggedIn,
      this.imageProfileUrl,
      this.createdAt,
      this.updatedAt,
      this.tenant});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    isVerified = json['is_verified'];
    isRegistrationCompleted = json['is_registration_completed'];
    isTermsAndPrivacyAgreed = json['is_terms_and_privacy_agreed'];
    lastLoggedIn = json['last_logged_in'];
    imageProfileUrl = json['image_profile_url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    tenant = json['tenant'] != null ? Tenant.fromJson(json['tenant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['is_verified'] = isVerified;
    data['is_registration_completed'] = isRegistrationCompleted;
    data['is_terms_and_privacy_agreed'] = isTermsAndPrivacyAgreed;
    data['last_logged_in'] = lastLoggedIn;
    data['image_profile_url'] = imageProfileUrl;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (tenant != null) {
      data['tenant'] = tenant!.toJson();
    }
    return data;
  }
}

class Tenant {
  int? id;
  String? businessType;
  String? otherBusinessName;

  Tenant({this.id, this.businessType, this.otherBusinessName});

  Tenant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    businessType = json['business_type'];
    otherBusinessName = json['other_business_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['business_type'] = businessType;
    data['other_business_name'] = otherBusinessName;
    return data;
  }
}
