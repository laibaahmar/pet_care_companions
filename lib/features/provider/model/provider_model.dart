import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet/features/provider/model/service_model.dart';
import '../../authentication/models/user_model.dart';

class ProviderModel extends UserModel {
  List<ServiceListingModel> services;  // List of services the provider offers
  String providerBio;  // A short bio for the provider
  double rating;  // Provider's rating from customer reviews
  int completedJobs;  // Number of jobs the provider has completed
  bool isAvailable;  // Availability status

  // Constructor
  ProviderModel({
    required String id,
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String phoneNo,
    required String profilePicture,
    required this.services,
    required this.providerBio,
    this.rating = 0.0,
    this.completedJobs = 0,
    this.isAvailable = true,
  }) : super(
    id: id,
    firstName: firstName,
    lastName: lastName,
    username: username,
    email: email,
    phoneNo: phoneNo,
    profilePicture: profilePicture,
  );

  // Convert Provider Model to Json
  @override
  Map<String, dynamic> toJson() {
    final userJson = super.toJson();
    userJson.addAll({
      'Services': services.map((service) => service.toJson()).toList(),
      'ProviderBio': providerBio,
      'Rating': rating,
      'CompletedJobs': completedJobs,
      'IsAvailable': isAvailable,
    });
    return userJson;
  }

  // Create Provider Model from Firebase Document
  factory ProviderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return ProviderModel(
        id: document.id,
        firstName: data?['FirstName'] ?? '',
        lastName: data?['LastName'] ?? '',
        username: data?['Username'] ?? '',
        email: data?['Email'] ?? '',
        phoneNo: data?['PhoneNumber'] ?? '',
        profilePicture: data?['ProfilePicture'] ?? '',
        services: (data?['Services'] as List)
            .map((service) => ServiceListingModel.fromSnapshot(service))
            .toList(),
        providerBio: data?['ProviderBio'] ?? '',
        rating: data?['Rating'] ?? 0.0,
        completedJobs: data?['CompletedJobs'] ?? 0,
        isAvailable: data?['IsAvailable'] ?? true,
      );
    } else {
      return ProviderModel.empty();
    }
  }

  // Function to create an empty provider model
  static ProviderModel empty() => ProviderModel(
    id: '',
    firstName: '',
    lastName: '',
    username: '',
    email: '',
    phoneNo: '',
    profilePicture: '',
    services: [],
    providerBio: '',
  );
}
