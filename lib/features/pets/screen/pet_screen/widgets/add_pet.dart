import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controller/pet_controller.dart';
import '../../../model/pet_model.dart';

class AddPetScreen extends StatelessWidget {
  final String userId;
  final PetController petController = Get.put(PetController());

  AddPetScreen({super.key, required this.userId});

  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _type = '';
  String _breed = '';
  int _age = 0;
  double _weight = 0;
  String sex = '';
  String _description = '';
  List<String> _diseases = [];
  List<String> _vaccinations = [];

  void _addPet() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      MedicalRecord medicalRecord = MedicalRecord(
        diseases: _diseases,
        vaccinations: _vaccinations,
      );

      Pet newPet = Pet(
        id: '',
        name: _name,
        type: _type,
        breed: _breed,
        age: _age,
        weight: _weight,
        sex: sex,
        description: _description,
        imageUrl: '',
        medicalRecord: medicalRecord,
      );

      petController.addPet(userId, newPet);
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Pet', style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.defaultPadding),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Pet Name'),
                  onSaved: (value) => _name = value!,
                  validator: (value) => Valid.validateEmpty('Name', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Type (e.g., Dog, Cat)'),
                  onSaved: (value) => _type = value!,
                  validator: (value) => Valid.validateEmpty('Type', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Breed'),
                  onSaved: (value) => _breed = value!,
                  validator: (value) => Valid.validateEmpty('Breed', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Age in months'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _age = int.tryParse(value!) ?? 0,
                  validator: (value) => Valid.validateEmpty('Age', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Sex'),
                  onSaved: (value) => sex = value!,
                  validator: (value) => Valid.validateEmpty('Sex', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Weight'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _weight = double.tryParse(value!) ?? 0,
                  validator: (value) => Valid.validateEmpty('Weight', value),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onSaved: (value) => _description = value!,
                  validator: (value) => Valid.validateEmpty('Description', value),
                  maxLines: 3,
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Diseases (comma separated)'),
                  onSaved: (value) => _diseases = value!.split(',').map((e) => e.trim()).toList(),
                ),
                SizedBox(height: Sizes.defaultPadding),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Vaccinations (comma separated)'),
                  onSaved: (value) => _vaccinations = value!.split(',').map((e) => e.trim()).toList(),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addPet,
                    child: const Text('Add Pet'),
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
