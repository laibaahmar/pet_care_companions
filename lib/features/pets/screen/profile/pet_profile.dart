import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pet/features/pets/screen/pet_screen/widgets/edit_pet.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../model/pet_model.dart';
import 'package:flutter/material.dart';

class PetProfile extends StatelessWidget {
  final Pet pet;
  User? user;

  PetProfile({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pet.name,
          style: const TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: pet.imageUrl.isNotEmpty
                      ? NetworkImage(pet.imageUrl)
                      : const AssetImage('assets/images/default_pet.png') as ImageProvider,
                  child: pet.imageUrl.isEmpty ? const Icon(Icons.pets, size: 50, color: Colors.white) : null,
                ),
              ),
              SizedBox(height: Sizes.defaultPadding),
              Container(
                padding: EdgeInsets.all(Sizes.defaultPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildPetInfoRow('Type', pet.type),
                    _buildPetInfoRow('Breed', pet.breed),
                    _buildPetInfoRow('Age', '${pet.age} months'),
                    _buildPetInfoRow('Description', pet.description),
                    _buildPetInfoRow('Diseases', pet.medicalRecord.diseases.join(', ') ?? 'None'),
                    _buildPetInfoRow('Vaccinations', pet.medicalRecord.vaccinations.join(', ') ?? 'None'),
                  ],
                ),
              ),
              SizedBox(height: Sizes.defaultPadding),
              Center(
                child: ElevatedButton(
                  onPressed: () => Get.to(() => EditPetScreen(pet: pet)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: logoPurple, // Change this to your desired button color
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text('Edit Profile'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
