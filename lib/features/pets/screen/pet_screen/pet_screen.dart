import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/constants/sizes.dart';
import 'package:pet/features/pets/screen/pet_screen/widgets/add_pet_button.dart';
import 'package:pet/features/pets/screen/profile/pet_profile.dart';
import '../../../../constants/colors.dart';
import '../../../personalization/controller/user_controller.dart';
import '../../controller/pet_controller.dart';

class MyPetsScreen extends StatelessWidget {
  final String userId;
  final PetController petController = Get.put(PetController());

  MyPetsScreen({super.key, required this.userId}) {
    petController.fetchPets(userId); // Fetch pets when the screen is created
  }

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Pets',
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
      ),
      body: Obx(() {
        if (petController.isLoadingImage.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (petController.pets.isEmpty) {
          return Padding(
            padding: EdgeInsets.all(Sizes.defaultPadding),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "You currently have no pets.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(height: Sizes.defaultPadding),
                SizedBox(
                  width: 150,
                  child: AddPetButton(userController: userController),
                ),
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: petController.pets.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => PetProfile(pet: petController.pets[index]));
                      },
                      child: ListTile(
                        leading: petController.pets[index].imageUrl.isNotEmpty
                            ? CircleAvatar(
                          backgroundImage: NetworkImage(petController.pets[index].imageUrl),
                        )
                            : const CircleAvatar(child: Icon(Icons.pets)),
                        title: Text(petController.pets[index].name),
                        subtitle: Text(
                          '${petController.pets[index].type}, ${petController.pets[index].breed}, Age: ${petController.pets[index].age}',
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (petController.pets.length < 5)
                Padding(
                  padding: EdgeInsets.all(Sizes.defaultPadding),
                  child: SizedBox(
                    width: 150,
                    child: AddPetButton(userController: userController),
                  ),
                ),
            ],
          );
        }
      }),
    );
  }
}
