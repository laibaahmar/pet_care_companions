// import 'package:pet/features/provider/model/service_model.dart';
//
// class ServiceProviderModel {
//   String id;
//   String bio;
//   String location;
//   double rating;
//   int completedJobs;
//   bool isAvailable;
//   List<ServiceModel> services; // List of services provided
//
//   ServiceProviderModel({
//     required this.id,
//     required this.bio,
//     required this.location,
//     this.rating = 0.0,
//     this.completedJobs = 0,
//     this.isAvailable = true,
//     required this.services,
//   });
//
//   // Convert model to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'Expertise': id,
//       'Bio': bio,
//       'Location': location,
//       'Rating': rating,
//       "Completed Jobs": completedJobs,
//       'Availability': isAvailable,
//       'Services': services.map((service) => service.toJson()).toList(),
//     };
//   }
//
//   // Create ServiceProviderModel from Firebase Document
//   factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
//     return ServiceProviderModel(
//       id: json['ID'] ?? '',
//       bio: json['Bio'] ?? '',
//       location: json['Location'] ?? '',
//       rating: (json['Rating'] as num?)?.toDouble() ?? 0.0,
//       completedJobs: json['Completed Jobs'] ?? '',
//       isAvailable: json['Availability'] ?? '',
//       services: (json['Services'] as List)
//           .map((service) => ServiceModel.fromJson(service))
//           .toList(),
//     );
//   }
//
//   static ServiceProviderModel empty() => ServiceProviderModel(
//     id: '',
//     bio: '',
//     location: '',
//     services: [],
//   );
// }

// provider_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceProviderModel {
  String id;
  String bio;
  DateTime createdAt;

  ServiceProviderModel({required this.id, required this.bio, required this.createdAt});

  static ServiceProviderModel empty() => ServiceProviderModel(id: '', bio: '', createdAt: DateTime.now());

  // Convert a ProviderModel into a Map. The Map is used to send data to Firestore
  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'createdAt': createdAt,
    };
  }

  // Convert a Map into a ProviderModel
  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
      id: json['ID'] ?? '',
      bio: json['Bio'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
}

