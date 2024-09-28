import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';

import '../model/pet_model.dart';

class PetController extends GetxController {
  static PetController get instance => Get.find();

    var pet = Pet.empty().obs;
    var pets = <Pet>[].obs;
    var isLoadingImage = false.obs;


    String? getCurrentUserId() {
      User? user = FirebaseAuth.instance.currentUser;
      return user?.uid; // Returns the user ID or null if not logged in
    }

    void addPet(String userId, Pet pet) async {
      String petId = FirebaseFirestore.instance.collection('Users').doc(userId).collection('pets').doc().id;
      pet.id = petId;

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('pets')
          .doc(petId)
          .set(pet.toMap());

      pets.add(pet);
    }

    void fetchPets(String userId) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('pets')
          .snapshots()
          .listen((snapshot) {
        pets.value = snapshot.docs.map((doc) => Pet.fromMap(doc.data() as Map<String, dynamic>)).toList();
      });
    }

    updatePet(String petId, Pet pet) async {
      String? userId = getCurrentUserId();

      if (userId == null) {
        print("No user is logged in.");
        return;
      }

      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('pets')
          .doc(petId)
          .update(pet.toMap());

      int index = pets.indexWhere((p) => p.id == petId);
      if (index != -1) {
        pets[index] = pet;
      }
    }

    Future<void> uploadProfilePicture(String petId) async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
        try {
          isLoadingImage.value = true; // Start shimmer effect

          // Create reference for the file in Firebase Storage
          String filePath = 'profile_pictures/${petId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
          UploadTask uploadTask = FirebaseStorage.instance.ref(filePath).putFile(imageFile);

          // Wait for the upload to complete
          TaskSnapshot taskSnapshot = await uploadTask;
          String downloadUrl = await taskSnapshot.ref.getDownloadURL();

          // Update the pet's profile picture URL in Firestore
          await FirebaseFirestore.instance.collection('pets').doc(petId).update({
            'imageUrl': downloadUrl,
          });

          // Update the local observable pet
          pet.update((val) {
            val?.imageUrl = downloadUrl;
          });

          Get.snackbar('Success', 'Profile picture updated successfully.');
        } catch (e) {
          Get.snackbar('Error', 'Failed to upload profile picture.');
        } finally {
          isLoadingImage.value = false; // Stop shimmer effect
        }
      }
    }
  }
