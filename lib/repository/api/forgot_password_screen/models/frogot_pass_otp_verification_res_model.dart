class ForgotPassOtpVerificationResModel {
  String? message;
  String? token;
  String? status;

  ForgotPassOtpVerificationResModel({
    this.message,
    this.token,
    this.status,
  });

  factory ForgotPassOtpVerificationResModel.fromJson(Map<String, dynamic> json) => ForgotPassOtpVerificationResModel(
        message: json["message"],
        token: json["token"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
        "status": status,
      };
}
