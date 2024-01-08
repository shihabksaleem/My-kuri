class LoginResModel {
  String? status;
  User? user;
  String? token;
  String? message;

  LoginResModel({
    this.status,
    this.user,
    this.token,
    this.message,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
        status: json["status"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        token: json["token"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user?.toJson(),
        "token": token,
        "message": message,
      };
}

class User {
  num? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic expiresAt;
  Customer? customer;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
    this.customer,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        expiresAt: json["expires_at"],
        customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "expires_at": expiresAt,
        "customer": customer?.toJson(),
      };
}

class Customer {
  num? id;
  num? userId;
  String? mobile;
  String? password;
  String? referrelCode;
  dynamic aadharNumber;
  String? otp;
  num? isVerified;
  num? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Customer({
    this.id,
    this.userId,
    this.mobile,
    this.password,
    this.referrelCode,
    this.aadharNumber,
    this.otp,
    this.isVerified,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        userId: json["user_id"],
        mobile: json["mobile"],
        password: json["password"],
        referrelCode: json["referrel_code"],
        aadharNumber: json["aadhar_number"],
        otp: json["otp"],
        isVerified: json["is_verified"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "mobile": mobile,
        "password": password,
        "referrel_code": referrelCode,
        "aadhar_number": aadharNumber,
        "otp": otp,
        "is_verified": isVerified,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
