class Employee {
  int id;
  int userTypeId;
  int employeeCode;
  String name;
  String email;
  String address;
  int mobile;
  String? image;
  dynamic ppf;
  dynamic pan;
  dynamic aadhar;
  dynamic description;
  dynamic emailVerifiedAt;
  String? fcmToken;
  String platform;
  DateTime createdAt;
  DateTime updatedAt;

  Employee({
    required this.id,
    required this.userTypeId,
    required this.employeeCode,
    required this.name,
    required this.email,
    required this.address,
    required this.mobile,
    required this.image,
    required this.ppf,
    required this.pan,
    required this.aadhar,
    required this.description,
    required this.emailVerifiedAt,
    required this.fcmToken,
    required this.platform,
    required this.createdAt,
    required this.updatedAt,
  });
  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    userTypeId: json["user_type_id"],
    employeeCode: json["employee_code"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    mobile: json["mobile"],
    image: json["image"],
    ppf: json["ppf"],
    pan: json["pan"],
    aadhar: json["aadhar"],
    description: json["description"],
    emailVerifiedAt: json["email_verified_at"],
    fcmToken: json["fcm_token"],
    platform: json["platform"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_type_id": userTypeId,
    "employee_code": employeeCode,
    "name": name,
    "email": email,
    "address": address,
    "mobile": mobile,
    "image": image,
    "ppf": ppf,
    "pan": pan,
    "aadhar": aadhar,
    "description": description,
    "email_verified_at": emailVerifiedAt,
    "fcm_token": fcmToken,
    "platform": platform,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
