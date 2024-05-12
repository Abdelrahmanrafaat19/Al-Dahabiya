class UserProfileData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  dynamic gender;
  dynamic birthDate;
  dynamic userStatus;
  int? cityId;
  int? zoneId;
  int? governmentId;
  String? createdAt;
  String? updatedAt;
  int? isNewsletterSubscripe;
  String? address;
  int? isActive;
  int? isBan;
  dynamic providerId;
  int? points;
  String? firebaseKey;
  String? lng;
  String? lat;

  UserProfileData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.gender,
      this.birthDate,
      this.userStatus,
      this.cityId,
      this.zoneId,
      this.governmentId,
      this.createdAt,
      this.updatedAt,
      this.isNewsletterSubscripe,
      this.address,
      this.isActive,
      this.isBan,
      this.providerId,
      this.points,
      this.firebaseKey,
      this.lng,
      this.lat});

  UserProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    birthDate = json['birth_date'];
    userStatus = json['user_status'];
    cityId = json['city_id'];
    zoneId = json['zone_id'];
    governmentId = json['government_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isNewsletterSubscripe = json['is_newsletter_subscripe'];
    address = json['address'];
    isActive = json['is_active'];
    isBan = json['is_ban'];
    providerId = json['provider_id'];
    points = json['points'];
    firebaseKey = json['firebase_key'];
    lng = json['lng'];
    lat = json['lat'];
  }
}
