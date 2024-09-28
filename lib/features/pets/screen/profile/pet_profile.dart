import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pet/features/pets/screen/pet_screen/widgets/edit_pet.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../model/pet_model.dart';
import 'package:flutter/material.dart';

class PetProfile extends StatelessWidget {
  final Pet pet;
  User? user;

  PetProfile({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pet.name, style: const TextStyle(color: textColor, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(Sizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: pet.imageUrl.isNotEmpty
                    ? NetworkImage(pet.imageUrl)
                    : const AssetImage('assets/images/default_pet.png') as ImageProvider,
                child: pet.imageUrl.isEmpty ? const Icon(Icons.pets, size: 60) : null,
              ),
            ),
            SizedBox(height: Sizes.defaultPadding),
            Text('Type: ${pet.type}', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: Sizes.defaultPadding),
            Text('Breed: ${pet.breed}', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: Sizes.defaultPadding),
            Text('Age: ${pet.age} months', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: Sizes.defaultPadding),
            Text('Description: ${pet.description}', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: Sizes.defaultPadding),
            Text('Diseases: ${pet.medicalRecord.diseases.join(', ')}', style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: Sizes.defaultPadding),
            Text('Vaccinations: ${pet.medicalRecord.vaccinations.join(', ')}', style: Theme.of(context).textTheme.bodyMedium),
            ElevatedButton(onPressed: () => Get.to(() => EditPetScreen(pet: pet,)), child: Text('Edit Profile'))
          ],
        ),
      ),
    );
  }
}
