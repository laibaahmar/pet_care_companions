  // import 'package:flutter/material.dart';
  // import 'package:get/get.dart';
  // import 'package:pet/common/widgets/loaders/loaders.dart';
  // import 'package:pet/utils/popups/full_screen_loader.dart';
  //
  // import '../../../../../constants/colors.dart';
  // import '../../../../../constants/images.dart';
  // import '../../../../../constants/sizes.dart';
  // import '../../../../../utils/validators/validation.dart';
  // import '../../../controller/pet_controller.dart';
  // import '../../../model/pet_model.dart';
  //
  // class EditPetScreen extends StatelessWidget {
  //   final Pet pet;
  //
  //   EditPetScreen({required this.pet});
  //
  //   final _formKey = GlobalKey<FormState>();
  //   late String _name = pet.name;
  //   late String _type = pet.type;
  //   late String _breed = pet.breed;
  //   late int _age = pet.age;
  //   late String _description = pet.description;
  //   late List<String> _diseases = pet.medicalRecord.diseases;
  //   late List<String> _vaccinations = pet.medicalRecord.vaccinations;
  //
  //   Future<void> _updatePet(BuildContext context) async {
  //     try {
  //       if (_formKey.currentState!.validate()) {
  //         _formKey.currentState!.save();
  //
  //         MedicalRecord updatedMedicalRecord = MedicalRecord(
  //           diseases: _diseases,
  //           vaccinations: _vaccinations,
  //         );
  //
  //         Pet updatedPet = Pet(
  //           id: pet.id,
  //           name: _name,
  //           type: _type,
  //           breed: _breed,
  //           age: _age,
  //           description: _description,
  //           imageUrl: pet.imageUrl,
  //           medicalRecord: updatedMedicalRecord,
  //         );
  //
  //         // Update the pet in Firestore
  //         await Get.find<PetController>().updatePet(pet.id, updatedPet);
  //
  //         Get.back();
  //
  //         Loaders.successSnackBar(title: "Congratulations!", message: 'Pet information has been updated');
  //
  //         // Navigate back
  //         Get.back();
  //       }
  //     } catch (e) {
  //       Loaders.errorSnackBar(title: "Oh Snap!");
  //       FullScreenLoader.stopLoading();
  //     }
  //   }
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       appBar: AppBar(
  //         title: const Text('Edit Pet', style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
  //         backgroundColor: Colors.white,
  //       ),
  //       body: SingleChildScrollView(
  //         child: Padding(
  //           padding: EdgeInsets.all(Sizes.defaultPadding),
  //           child: Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  //                 TextFormField(
  //                   initialValue: _name,
  //                   decoration: InputDecoration(labelText: 'Pet Name'),
  //                   onSaved: (value) => _name = value!,
  //                   validator: (value) => Valid.validateEmpty('Name', value),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _type,
  //                   decoration: InputDecoration(labelText: 'Type (e.g., Dog, Cat)'),
  //                   onSaved: (value) => _type = value!,
  //                   validator: (value) => Valid.validateEmpty('Type', value),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _breed,
  //                   decoration: InputDecoration(labelText: 'Breed'),
  //                   onSaved: (value) => _breed = value!,
  //                   validator: (value) => Valid.validateEmpty('Breed', value),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _age.toString(),
  //                   decoration: const InputDecoration(labelText: 'Age in months'),
  //                   keyboardType: TextInputType.number,
  //                   onSaved: (value) => _age = int.tryParse(value!) ?? 0,
  //                   validator: (value) => Valid.validateEmpty('Age', value),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _description,
  //                   decoration: InputDecoration(labelText: 'Description'),
  //                   onSaved: (value) => _description = value!,
  //                   validator: (value) => Valid.validateEmpty('Description', value),
  //                   maxLines: 3,
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _diseases.join(', '),
  //                   decoration: InputDecoration(labelText: 'Diseases (comma separated)'),
  //                   onSaved: (value) => _diseases = value!.split(',').map((e) => e.trim()).toList(),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: Sizes.defaultPadding),
  //                 TextFormField(
  //                   initialValue: _vaccinations.join(', '),
  //                   decoration: InputDecoration(labelText: 'Vaccinations (comma separated)'),
  //                   onSaved: (value) => _vaccinations = value!.split(',').map((e) => e.trim()).toList(),
  //                   style: const TextStyle(fontSize: 14),
  //                 ),
  //                 SizedBox(height: 20),
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: ElevatedButton(
  //                     onPressed: () => _updatePet(context),
  //                     child: Text('Update Pet'),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:image_picker/image_picker.dart';
  import 'package:pet/common/widgets/loaders/loaders.dart';
  import 'package:pet/utils/popups/full_screen_loader.dart';
  import 'package:shimmer/shimmer.dart';
  import 'dart:io';

  import '../../../../../constants/colors.dart';
  import '../../../../../constants/sizes.dart';
  import '../../../../../utils/validators/validation.dart';
import '../../../controller/pet_controller.dart';
  import '../../../model/pet_model.dart';

  class EditPetScreen extends StatelessWidget {
    final Pet pet;
    final PetController petController = Get.put(PetController());
    final _formKey = GlobalKey<FormState>();

    late String _name = pet.name;
    late String _type = pet.type;
    late String _breed = pet.breed;
    late int _age = pet.age;
    late double _weight = pet.weight;
    late String sex = pet.sex;
    late String _description = pet.description;
    late List<String> _diseases = pet.medicalRecord.diseases;
    late List<String> _vaccinations = pet.medicalRecord.vaccinations;
    String? _imageUrl;

    EditPetScreen({required this.pet});

    Future<void> _pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // You can upload the image and get the URL here
        // For example: _imageUrl = await uploadImage(pickedFile.path);
        _imageUrl = pickedFile.path; // Temporarily store the image path
      }
    }

    Future<void> _updatePet(BuildContext context) async {
      try {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();

          MedicalRecord updatedMedicalRecord = MedicalRecord(
            diseases: _diseases,
            vaccinations: _vaccinations,
          );

          Pet updatedPet = Pet(
            id: pet.id,
            name: _name,
            type: _type,
            breed: _breed,
            age: _age,
            sex: sex,
            weight: _weight,
            description: _description,
            imageUrl: _imageUrl ?? pet.imageUrl, // Use the new image URL if available
            medicalRecord: updatedMedicalRecord,
          );

          // Update the pet in Firestore
          await petController.updatePet(pet.id, updatedPet);

          Loaders.successSnackBar(title: "Congratulations!", message: 'Pet information has been updated');
          Get.back();
        }
      } catch (e) {
        Loaders.errorSnackBar(title: "Oh Snap!");
        FullScreenLoader.stopLoading();
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Pet', style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Sizes.defaultPadding),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Shimmer effect while loading image
                        _imageUrl == null && pet.imageUrl.isEmpty
                            ? Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                          ),
                        )
                            : CircleAvatar(
                          radius: 50,
                          backgroundImage: _imageUrl != null
                              ? FileImage(File(_imageUrl!))
                              : pet.imageUrl.isNotEmpty
                              ? NetworkImage(pet.imageUrl)
                              : AssetImage('assets/default_pet_image.png') as ImageProvider,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt, color: Colors.blueAccent),
                            onPressed: _pickImage,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _name,
                    decoration: InputDecoration(labelText: 'Pet Name'),
                    onSaved: (value) => _name = value!,
                    validator: (value) => Valid.validateEmpty('Name', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _type,
                    decoration: InputDecoration(labelText: 'Type (e.g., Dog, Cat)'),
                    onSaved: (value) => _type = value!,
                    validator: (value) => Valid.validateEmpty('Type', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _breed,
                    decoration: InputDecoration(labelText: 'Breed'),
                    onSaved: (value) => _breed = value!,
                    validator: (value) => Valid.validateEmpty('Breed', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _age.toString(),
                    decoration: const InputDecoration(labelText: 'Age in months'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _age = int.tryParse(value!) ?? 0,
                    validator: (value) => Valid.validateEmpty('Age', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _weight.toString(),
                    decoration: const InputDecoration(labelText: 'Weight in kg'),
                    keyboardType: TextInputType.number,
                    onSaved: (value) => _weight = value! as double,
                    validator: (value) => Valid.validateEmpty('Weight', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: sex,
                    decoration: InputDecoration(labelText: 'Sex'),
                    onSaved: (value) => sex = value!,
                    validator: (value) => Valid.validateEmpty('Sex', value),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _description,
                    decoration: InputDecoration(labelText: 'Description'),
                    onSaved: (value) => _description = value!,
                    validator: (value) => Valid.validateEmpty('Description', value),
                    maxLines: 3,
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _diseases.join(', '),
                    decoration: InputDecoration(labelText: 'Diseases (comma separated)'),
                    onSaved: (value) => _diseases = value!.split(',').map((e) => e.trim()).toList(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: Sizes.defaultPadding),
                  TextFormField(
                    initialValue: _vaccinations.join(', '),
                    decoration: InputDecoration(labelText: 'Vaccinations (comma separated)'),
                    onSaved: (value) => _vaccinations = value!.split(',').map((e) => e.trim()).toList(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _updatePet(context),
                      child: Text('Update Pet'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
