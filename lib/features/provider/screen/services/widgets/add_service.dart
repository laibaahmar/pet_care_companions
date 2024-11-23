// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet/constants/sizes.dart';
// import '../../../controller/provider_controller.dart';
//
// class AddServicePage extends StatelessWidget {
//   final ProviderController controller = Get.put(ProviderController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Add New Service'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: controller.formKey, // Use formKey from controller
//           child: ListView(
//             children: [
//               // Name input
//               TextFormField(
//                 controller: controller.nameController,
//                 decoration: InputDecoration(labelText: 'Service Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the service name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: Sizes.s,),
//
//               // Description input
//               TextFormField(
//                 controller: controller.descriptionController,
//                 decoration: InputDecoration(labelText: 'Service Description'),
//                 maxLines: 3,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: Sizes.s,),
//
//               // Price input
//               TextFormField(
//                 controller: controller.priceController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Price (Rs.)'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the service price';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: Sizes.s,),
//
//               // Duration input
//               TextFormField(
//                 controller: controller.durationController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(labelText: 'Duration (minutes)'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the service duration';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: Sizes.s,),
//
//               // Category Dropdown
//               Obx(() => DropdownButtonFormField<String>(
//                 value: controller.selectedCategory.value.isNotEmpty ? controller.selectedCategory.value : null, // Ensure value is valid
//                 decoration: InputDecoration(labelText: 'Category'),
//                 items: controller.categorySubCategories.keys.map((category) {
//                   return DropdownMenuItem<String>(
//                     value: category,
//                     child: Text(category),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   controller.selectedCategory.value = value!;
//                   controller.selectedSubCategory.value = controller.categorySubCategories[value]?.first ?? ''; // Reset subcategory with the first available option
//                 },
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please select a category';
//                   }
//                   return null;
//                 },
//               )),
//
//               SizedBox(height: Sizes.s,),
//
//               // Subcategory Dropdown
//               Obx(() {
//                 if (controller.selectedCategory.value.isNotEmpty) {
//                   return DropdownButtonFormField<String>(
//                     value: controller.selectedSubCategory.value.isNotEmpty ? controller.selectedSubCategory.value : null, // Ensure value is valid
//                     decoration: InputDecoration(labelText: 'Subcategory'),
//                     items: controller
//                         .categorySubCategories[controller.selectedCategory.value]!
//                         .map((subcategory) {
//                       return DropdownMenuItem<String>(
//                         value: subcategory,
//                         child: Text(subcategory),
//                       );
//                     }).toList(),
//                     onChanged: (value) {
//                       controller.selectedSubCategory.value = value!;
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select a subcategory';
//                       }
//                       return null;
//                     },
//                   );
//                 } else {
//                   return SizedBox.shrink();
//                 }
//               }),
//               SizedBox(height: Sizes.s,),
//
//               // Availability Switch
//               Obx(() => SwitchListTile(
//                 title: Text('Service Available'),
//                 value: controller.isAvailable.value,
//                 onChanged: (value) {
//                   controller.isAvailable.value = value;
//                 },
//               )),
//
//               SizedBox(height: 20),
//
//               // Submit Button
//               ElevatedButton(
//                 onPressed: () {
//                   if (controller.formKey.currentState!.validate()) {
//                     controller.addService(providerId: FirebaseAuth.instance.currentUser?.uid);
//                   }
//                 },
//                 child: Text('Add Service'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/constants/sizes.dart';
import '../../../controller/provider_controller.dart';

class AddServicePage extends StatelessWidget {
  final ProviderController controller = Get.find<ProviderController>(); // Use existing instance

  AddServicePage({super.key}) {
    controller.clearForm(); // Clear fields when navigating to this page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Add New Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Service Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service name';
                  }
                  return null;
                },
              ),
              SizedBox(height: Sizes.s),

              TextFormField(
                controller: controller.descriptionController,
                decoration: const InputDecoration(labelText: 'Service Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: Sizes.s),

              TextFormField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Price (Rs.)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service price';
                  }
                  return null;
                },
              ),
              SizedBox(height: Sizes.s),

              TextFormField(
                controller: controller.durationController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Duration (minutes)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: Sizes.s),

              Obx(() => DropdownButtonFormField<String>(
                value: controller.selectedCategory.value.isNotEmpty ? controller.selectedCategory.value : null,
                decoration: const InputDecoration(labelText: 'Category'),
                items: controller.categorySubCategories.keys.map((category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedCategory.value = value!;
                  controller.selectedSubCategory.value = controller.categorySubCategories[value]?.first ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a category';
                  }
                  return null;
                },
              )),
              SizedBox(height: Sizes.s),

              Obx(() {
                if (controller.selectedCategory.value.isNotEmpty) {
                  return DropdownButtonFormField<String>(
                    value: controller.selectedSubCategory.value.isNotEmpty ? controller.selectedSubCategory.value : null,
                    decoration: const InputDecoration(labelText: 'Subcategory'),
                    items: controller.categorySubCategories[controller.selectedCategory.value]!.map((subcategory) {
                      return DropdownMenuItem<String>(
                        value: subcategory,
                        child: Text(subcategory),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedSubCategory.value = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a subcategory';
                      }
                      return null;
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }),
              SizedBox(height: Sizes.s),

              Obx(() => SwitchListTile(
                title: const Text('Service Available'),
                value: controller.isAvailable.value,
                onChanged: (value) {
                  controller.isAvailable.value = value;
                },
              )),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.addService(providerId: FirebaseAuth.instance.currentUser?.uid);
                  }
                },
                child: const Text('Add Service'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

