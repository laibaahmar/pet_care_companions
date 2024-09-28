import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceListingModel {
  final String serviceId;  // Unique ID for the service
  String serviceName;  // Name of the service
  String description;  // Description of the service
  double price;  // Price for the service
  String duration;  // Duration of the service (e.g., "30 minutes")
  bool isAvailable;  // Whether the service is currently available

  // Constructor
  ServiceListingModel({
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.price,
    required this.duration,
    this.isAvailable = true,
  });

  // Convert Service Listing to Json
  Map<String, dynamic> toJson() {
    return {
      'ServiceId': serviceId,
      'ServiceName': serviceName,
      'Description': description,
      'Price': price,
      'Duration': duration,
      'IsAvailable': isAvailable,
    };
  }

  // Create Service Listing from Firebase Document
  factory ServiceListingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return ServiceListingModel(
        serviceId: document.id,
        serviceName: data?['ServiceName'] ?? '',
        description: data?['Description'] ?? '',
        price: data?['Price'] ?? 0.0,
        duration: data?['Duration'] ?? '',
        isAvailable: data?['IsAvailable'] ?? true,
      );
    } else {
      return ServiceListingModel.empty();
    }
  }

  // Function to create an empty Service Listing Model
  static ServiceListingModel empty() => ServiceListingModel(
    serviceId: '',
    serviceName: '',
    description: '',
    price: 0.0,
    duration: '',
    isAvailable: false,
  );
}
