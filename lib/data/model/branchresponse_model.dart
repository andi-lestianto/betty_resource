class BranchesResponse {
  int? statusCode;
  String? status;
  String? message;
  List<Branches>? data;

  BranchesResponse({this.statusCode, this.status, this.message, this.data});

  BranchesResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Branches>[];
      json['data'].forEach((v) {
        data!.add(Branches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Branches {
  int? id;
  String? branchName;
  String? address;
  String? city;
  String? province;
  String? postalCode;
  String? phoneNumber;
  String? imageProfileUrl;
  bool? isPrimary;
  String? createdAt;
  String? updatedAt;

  Branches(
      {this.id,
      this.branchName,
      this.address,
      this.city,
      this.province,
      this.postalCode,
      this.phoneNumber,
      this.imageProfileUrl,
      this.isPrimary,
      this.createdAt,
      this.updatedAt});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
    address = json['address'];
    city = json['city'];
    province = json['province'];
    postalCode = json['postal_code'];
    phoneNumber = json['phone_number'];
    imageProfileUrl = json['image_profile_url'];
    isPrimary = json['is_primary'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['branch_name'] = branchName;
    data['address'] = address;
    data['city'] = city;
    data['province'] = province;
    data['postal_code'] = postalCode;
    data['phone_number'] = phoneNumber;
    data['image_profile_url'] = imageProfileUrl;
    data['is_primary'] = isPrimary;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
