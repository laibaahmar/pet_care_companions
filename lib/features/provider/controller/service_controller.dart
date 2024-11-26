import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../model/service_model.dart'; // Adjust the import based on your project structure

class ServiceController extends GetxController {
  var services = <ServiceModel>[].obs; // Observable list of services

  @override
  void onInit() {
    super.onInit();
    fetchServices(); // Fetch services when controller is initialized
  }

  // Fetch services from Firestore
  void fetchServices() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('services').get();
      services.value = querySnapshot.docs.map((doc) {
        return ServiceModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch services: $e");
    }
  }

  // Add a new service to Firestore
  void addService(String name, double price, int durationInMinutes, String category, [String? certificateUrl]) async {
    String serviceId = FirebaseFirestore.instance.collection('services').doc().id; // Generate new document ID

    ServiceModel newService = ServiceModel(
      serviceId: serviceId,
      name: name,
      description: '', // Add description if needed
      price: price,
      durationInMinutes: durationInMinutes,
      isAvailable: true,
      category: category, // Replace with dynamic category if needed
      certificateUrl: certificateUrl, // Store the certificate URL (optional)
    );

    try {
      await FirebaseFirestore.instance.collection('services').doc(serviceId).set(newService.toJson());
      services.add(newService); // Add the new service to the observable list
      Get.snackbar("Success", "Service added successfully!");
    } catch (e) {
      Get.snackbar("Error", "Failed to add service: $e");
    }
  }

  // Toggle service availability
  void toggleServiceAvailability(int index) {
    ServiceModel service = services[index];
    service.isAvailable = !service.isAvailable;

    FirebaseFirestore.instance
        .collection('services')
        .doc(service.serviceId)
        .update({'IsAvailable': service.isAvailable}).then((_) {
      services[index] = service; // Update the observable list
      Get.snackbar("Success", "Service availability updated!");
    }).catchError((error) {
      Get.snackbar("Error", "Failed to update availability: $error");
    });
  }

  // Upload certificate (PDF) to Firebase Storage
  Future<String?> uploadCertificateToFirebase(BuildContext context, String filePath, String serviceId) async {
    try {
      // Reference to Firebase Storage
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('certificates/$serviceId.pdf'); // Store PDF under serviceId.pdf

      // Upload the file
      UploadTask uploadTask = ref.putFile(File(filePath));

      // Wait for the upload to complete
      TaskSnapshot snapshot = await uploadTask;

      // Get the file URL
      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl; // Return the URL of the uploaded PDF
    } catch (e) {
      Get.snackbar("Error", "Failed to upload certificate: $e");
      return null;
    }
  }
}
