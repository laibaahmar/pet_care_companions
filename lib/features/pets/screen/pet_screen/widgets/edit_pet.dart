import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/common/widgets/loaders/loaders.dart';
import 'package:pet/utils/popups/full_screen_loader.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/pet_controller.dart';
import '../../../model/pet_model.dart';

class EditPetScreen extends StatelessWidget {
  final Pet pet;
  final PetController petController = Get.put(PetController());
  final _formKey = GlobalKey<FormState>();

  // Initialize variables with default values from pet
  late String _name = pet.name;
  late String _type = pet.type;
  late String _breed = pet.breed;
  late int _age = pet.age;
  late double _weight = pet.weight;
  late String _sex = pet.sex;
  late String _description = pet.description;
  late List<String> _diseases = pet.medicalRecord.diseases;
  late List<String> _vaccinations = pet.medicalRecord.vaccinations;
  String? _imageUrl;

  EditPetScreen({super.key, required this.pet});

  Future<void> _updatePet(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      FullScreenLoader.openLoadingDialogue('Updating Pet...', loader);

      try {
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
          sex: _sex,
          weight: _weight,
          description: _description,
          imageUrl: _imageUrl ?? pet.imageUrl,
          medicalRecord: updatedMedicalRecord,
        );

        await petController.updatePet(pet.id, updatedPet);
        Loaders.successSnackBar(title: "Congratulations!", message: 'Pet information has been updated');
        Get.back();
      } catch (e) {
        Loaders.errorSnackBar(title: "Oh Snap!", message: "An error occurred while updating.");
        print("Error updating pet: $e"); // Log the error
      } finally {
        FullScreenLoader.stopLoading();
      }
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
                SizedBox(height: Sizes.defaultPadding),
                _buildTextFormField('Pet Name', (value) => _name = value!),
                SizedBox(height: Sizes.defaultPadding),
                _buildTextFormField('Type (e.g., Dog, Cat)', (value) => _type = value!),
                SizedBox(height: Sizes.defaultPadding),
                _buildTextFormField('Breed', (value) => _breed = value!),
                SizedBox(height: Sizes.defaultPadding),
                _buildNumericFormField('Age in months', (value) => _age = int.tryParse(value!) ?? 0),
                SizedBox(height: Sizes.defaultPadding),
                _buildNumericFormField('Weight in kg', (value) => _weight = double.tryParse(value!) ?? 0.0),
                SizedBox(height: Sizes.defaultPadding),
                _buildTextFormField('Sex', (value) => _sex = value!),
                SizedBox(height: Sizes.defaultPadding),
                _buildTextFormField('Description', (value) => _description = value!, maxLines: 3),
                SizedBox(height: Sizes.defaultPadding),
                _buildCommaSeparatedFormField('Diseases (comma separated)', (value) => _diseases = value!.split(',').map((e) => e.trim()).toList()),
                SizedBox(height: Sizes.defaultPadding),
                _buildCommaSeparatedFormField('Vaccinations (comma separated)', (value) => _vaccinations = value!.split(',').map((e) => e.trim()).toList()),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _updatePet(context),
                    child: const Text('Update Pet'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build text form fields
  TextFormField _buildTextFormField(String label, Function(String?) onSaved, {int maxLines = 1}) {
    return TextFormField(
      initialValue: label == 'Pet Name' ? _name : label == 'Type (e.g., Dog, Cat)' ? _type : label == 'Breed' ? _breed : label == 'Sex' ? _sex : label == 'Description' ? _description : '',
      decoration: InputDecoration(labelText: label),
      onSaved: onSaved,
      validator: (value) => Valid.validateEmpty(label, value),
      maxLines: maxLines,
      style: const TextStyle(fontSize: 14),
    );
  }

  // Helper method to build numeric form fields
  TextFormField _buildNumericFormField(String label, Function(String?) onSaved) {
    return TextFormField(
      initialValue: label == 'Age in months' ? _age.toString() : _weight.toString(),
      decoration: InputDecoration(labelText: label),
      keyboardType: TextInputType.number,
      onSaved: onSaved,
      validator: (value) => Valid.validateEmpty(label, value),
      style: const TextStyle(fontSize: 14),
    );
  }

  // Helper method to build comma-separated form fields
  TextFormField _buildCommaSeparatedFormField(String label, Function(String?) onSaved) {
    return TextFormField(
      initialValue: label == 'Diseases (comma separated)' ? _diseases.join(', ') : _vaccinations.join(', '),
      decoration: InputDecoration(labelText: label),
      onSaved: onSaved,
      style: const TextStyle(fontSize: 14),
    );
  }
}
