import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet/common/widgets/loaders/loaders.dart';
import 'package:pet/constants/images.dart';
import 'package:pet/features/provider/model/provider_model.dart';
import 'package:pet/utils/popups/full_screen_loader.dart';
import '../model/service_model.dart';

class ProviderController extends GetxController {
  var providerBio = ''.obs;
  var isEditing = false.obs;
  Rx<ServiceProviderModel> user = ServiceProviderModel
      .empty()
      .obs;
  var services = <ServiceModel>[].obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Controllers for form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  // Reactive variables for category and subcategory
  RxBool isAvailable = true.obs;
  var selectedCategory = ''.obs;
  var selectedSubCategory = ''.obs;

  void initializeWithService(ServiceModel service) {
    nameController.text = service.name;
    descriptionController.text = service.description;
    priceController.text = service.price.toString();
    durationController.text = service.durationInMinutes.toString();
    selectedCategory.value = service.category;
    isAvailable.value = service.isAvailable;
  }

  // Define your category and subcategories
  Map<String, List<String>> categorySubCategories = {
    'Pet Care': [
      'Vaccination',
      'Dental Care',
      'Routine Checkup',
      'Illness and Injuries',
      'Pet Sitting',
      'Pet Walking',
      'Litter Training'
    ],
    'Pet Grooming': ['Bathing', 'Styling', 'Hair Cutting/Deshedding'],
  };

  // Make sure to assign valid initial values
  @override
  void onInit() {
    super.onInit();
    if (categorySubCategories.isNotEmpty) {
      selectedCategory.value =
          categorySubCategories.keys.first; // Set the first category as default
      selectedSubCategory.value =
          categorySubCategories[selectedCategory.value]?.first ??
              ''; // Set the first subcategory as default
    }
  }

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  void loadBio(String bio) {
    providerBio.value = bio;
  }

  Future<void> loadBioFromFirebase(String providerId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('providers')
          .doc(providerId)
          .get();

      if (snapshot.exists) {
        final data = snapshot.data() as Map<String, dynamic>?;
        if (data != null && data['bio'] != null) {
          providerBio.value = data['bio'];
        }
      }
    } catch (e) {
      print('Error fetching bio: $e');
    }
  }

  Future<void> saveBio(String bio, String providerId) async {
    try {
      FullScreenLoader.openLoadingDialogue("Updating Bio...", loader);
      await FirebaseFirestore.instance.collection('providers')
          .doc(providerId)
          .set({
        'bio': bio,
      }, SetOptions(merge: true));
      providerBio.value = bio; // Update the local bio state
      FullScreenLoader.stopLoading();
    } catch (e) {
      print('Error saving bio: $e');
      FullScreenLoader.stopLoading();
    }
  }

  Future<void> fetchServices(String providerId) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('providers')
          .doc(providerId)
          .collection('Services')
          .get();

      // Map Firestore documents to ServiceModel objects and update the services list
      services.value = snapshot.docs
          .map((doc) =>
          ServiceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error fetching services: $e');
    }
  }

  Future<void> addService(BuildContext context, {required providerId, String? certificateUrl,}) async {
    String serviceId = DateTime
        .now()
        .millisecondsSinceEpoch
        .toString(); // Example of generating a unique ID

    // Create a new ServiceModel based on user input
    ServiceModel newService = ServiceModel(
      serviceId: serviceId,
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      durationInMinutes: int.parse(durationController.text),
      isAvailable: isAvailable.value,
      category: selectedSubCategory.value,
      certificateUrl: certificateUrl,
    );

    try {
      FullScreenLoader.openLoadingDialogue("Adding Service...", loader);
      await FirebaseFirestore.instance
          .collection('providers')
          .doc(providerId)
          .collection('Services')
          .doc(serviceId)
          .set(newService.toJson());

      Loaders.successSnackBar(
          title: "Success!", message: 'Service is added successfully');

      FullScreenLoader.stopLoading();

      clearForm();
      Navigator.of(context).pop();
    } catch (e) {
      Loaders.errorSnackBar(
          title: "Error", message: 'Failed to add service: $e');
      FullScreenLoader.stopLoading();
    }
  }

  // Clear form after submission
  void clearForm() {
    nameController.clear();
    descriptionController.clear();
    priceController.clear();
    durationController.clear();
    selectedCategory.value = '';
    selectedSubCategory.value = '';
    isAvailable.value = true;
  }

  Future<void> updateService(String serviceId, {required String providerId, String? certificateUrl}) async {
    final updatedService = ServiceModel(
      serviceId: serviceId,
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      durationInMinutes: int.parse(durationController.text),
      isAvailable: isAvailable.value,
      category: selectedCategory.value, // Using selected category
    );

    try {
      FullScreenLoader.openLoadingDialogue("Updating Service...", loader);

      // Perform the update operation in Firestore
      await FirebaseFirestore.instance
          .collection('providers')
          .doc(providerId)
          .collection('Services')
          .doc(serviceId)
          .update(updatedService.toJson());

      // Update the local services list
      int index = services.indexWhere((service) => service.serviceId == serviceId);
      if (index != -1) {
        services[index] = updatedService; // Update the service in the local list
      }

      clearForm();
      Get.back();

      Loaders.successSnackBar(
          title: "Success!", message: 'Service updated successfully');
      FullScreenLoader.stopLoading();
    } catch (e) {
      Loaders.errorSnackBar(title: "Error", message: 'Failed to update service: $e');
      FullScreenLoader.stopLoading();
    }
  }


  Future<void> deleteService(BuildContext context, String serviceId, String providerId) async {
    try {
      // Open loading dialog
      FullScreenLoader.openLoadingDialogue("Deleting Service...", loader);

      // Delete the service document from Firestore
      await FirebaseFirestore.instance
          .collection('providers')
          .doc(providerId)
          .collection('Services')
          .doc(serviceId)
          .delete();


      services.removeWhere((service) => service.serviceId == serviceId);
      // Show success message

      Loaders.successSnackBar(title: "Success!", message: 'Service is deleted successfully');
      FullScreenLoader.stopLoading();
      Navigator.of(context).pop();

    } catch (e) {
      // Show error message
      Loaders.errorSnackBar(title: "Error", message: 'Failed to delete service: $e');

      // Stop loading dialog
      FullScreenLoader.stopLoading();
    }
  }

}
