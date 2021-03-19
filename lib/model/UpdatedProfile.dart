// To parse this JSON data, do
//
//     final updatedProfile = updatedProfileFromJson(jsonString);

import 'dart:convert';

UpdatedProfile updatedProfileFromJson(String str) => UpdatedProfile.fromJson(json.decode(str));

String updatedProfileToJson(UpdatedProfile data) => json.encode(data.toJson());

class UpdatedProfile {
  UpdatedProfile({
    this.success,
    this.message,
    this.minimumPhoneNumberLength,
    this.maximumPhoneNumberLength,
    this.user,
  });

  bool success;
  int message;
  int minimumPhoneNumberLength;
  int maximumPhoneNumberLength;
  Users user;

  factory UpdatedProfile.fromJson(Map<String, dynamic> json) => UpdatedProfile(
    success: json["success"],
    message: json["message"],
    minimumPhoneNumberLength: json["minimum_phone_number_length"],
    maximumPhoneNumberLength: json["maximum_phone_number_length"],
    user: Users.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "minimum_phone_number_length": minimumPhoneNumberLength,
    "maximum_phone_number_length": maximumPhoneNumberLength,
    "user": user.toJson(),
  };
}

class Users {
  Users({
    this.favouriteStores,
    this.paymentIntentId,
    this.customerId,
    this.imageUrl,
    this.comments,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.socialId,
    this.socialIds,
    this.loginBy,
    this.countryPhoneCode,
    this.appVersion,
    this.phone,
    this.address,
    this.city,
    this.deviceToken,
    this.deviceType,
    this.serverToken,
    this.orders,
    this.promoCount,
    this.referralCode,
    this.isReferral,
    this.totalReferrals,
    this.storeRate,
    this.storeRateCount,
    this.providerRate,
    this.providerRateCount,
    this.wallet,
    this.walletCurrencyCode,
    this.isUseWallet,
    this.isApproved,
    this.isEmailVerified,
    this.isPhoneNumberVerified,
    this.isDocumentUploaded,
    this.isUserTypeApproved,
    this.id,
    this.userType,
    this.adminType,
    this.userTypeId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.uniqueId,
    this.v,
  });

  List<dynamic> favouriteStores;
  String paymentIntentId;
  String customerId;
  String imageUrl;
  String comments;
  String firstName;
  String lastName;
  String email;
  dynamic password;
  String socialId;
  List<dynamic> socialIds;
  String loginBy;
  String countryPhoneCode;
  String appVersion;
  String phone;
  String address;
  String city;
  String deviceToken;
  String deviceType;
  String serverToken;
  List<dynamic> orders;
  int promoCount;
  String referralCode;
  bool isReferral;
  int totalReferrals;
  int storeRate;
  int storeRateCount;
  int providerRate;
  int providerRateCount;
  int wallet;
  String walletCurrencyCode;
  bool isUseWallet;
  bool isApproved;
  bool isEmailVerified;
  bool isPhoneNumberVerified;
  bool isDocumentUploaded;
  bool isUserTypeApproved;
  String id;
  int userType;
  int adminType;
  dynamic userTypeId;
  String countryId;
  DateTime createdAt;
  DateTime updatedAt;
  int uniqueId;
  int v;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    favouriteStores: List<dynamic>.from(json["favourite_stores"].map((x) => x)),
    paymentIntentId: json["payment_intent_id"],
    customerId: json["customer_id"],
    imageUrl: json["image_url"],
    comments: json["comments"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    password: json["password"],
    socialId: json["social_id"],
    socialIds: List<dynamic>.from(json["social_ids"].map((x) => x)),
    loginBy: json["login_by"],
    countryPhoneCode: json["country_phone_code"],
    appVersion: json["app_version"],
    phone: json["phone"],
    address: json["address"],
    city: json["city"],
    deviceToken: json["device_token"],
    deviceType: json["device_type"],
    serverToken: json["server_token"],
    orders: List<dynamic>.from(json["orders"].map((x) => x)),
    promoCount: json["promo_count"],
    referralCode: json["referral_code"],
    isReferral: json["is_referral"],
    totalReferrals: json["total_referrals"],
    storeRate: json["store_rate"],
    storeRateCount: json["store_rate_count"],
    providerRate: json["provider_rate"],
    providerRateCount: json["provider_rate_count"],
    wallet: json["wallet"],
    walletCurrencyCode: json["wallet_currency_code"],
    isUseWallet: json["is_use_wallet"],
    isApproved: json["is_approved"],
    isEmailVerified: json["is_email_verified"],
    isPhoneNumberVerified: json["is_phone_number_verified"],
    isDocumentUploaded: json["is_document_uploaded"],
    isUserTypeApproved: json["is_user_type_approved"],
    id: json["_id"],
    userType: json["user_type"],
    adminType: json["admin_type"],
    userTypeId: json["user_type_id"],
    countryId: json["country_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    uniqueId: json["unique_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "favourite_stores": List<dynamic>.from(favouriteStores.map((x) => x)),
    "payment_intent_id": paymentIntentId,
    "customer_id": customerId,
    "image_url": imageUrl,
    "comments": comments,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "password": password,
    "social_id": socialId,
    "social_ids": List<dynamic>.from(socialIds.map((x) => x)),
    "login_by": loginBy,
    "country_phone_code": countryPhoneCode,
    "app_version": appVersion,
    "phone": phone,
    "address": address,
    "city": city,
    "device_token": deviceToken,
    "device_type": deviceType,
    "server_token": serverToken,
    "orders": List<dynamic>.from(orders.map((x) => x)),
    "promo_count": promoCount,
    "referral_code": referralCode,
    "is_referral": isReferral,
    "total_referrals": totalReferrals,
    "store_rate": storeRate,
    "store_rate_count": storeRateCount,
    "provider_rate": providerRate,
    "provider_rate_count": providerRateCount,
    "wallet": wallet,
    "wallet_currency_code": walletCurrencyCode,
    "is_use_wallet": isUseWallet,
    "is_approved": isApproved,
    "is_email_verified": isEmailVerified,
    "is_phone_number_verified": isPhoneNumberVerified,
    "is_document_uploaded": isDocumentUploaded,
    "is_user_type_approved": isUserTypeApproved,
    "_id": id,
    "user_type": userType,
    "admin_type": adminType,
    "user_type_id": userTypeId,
    "country_id": countryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "unique_id": uniqueId,
    "__v": v,
  };
}
