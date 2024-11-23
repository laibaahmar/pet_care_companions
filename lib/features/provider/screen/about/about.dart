// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:pet/constants/sizes.dart';
// // import 'package:pet/constants/colors.dart';
// // import '../../../../data/repositories/service_provider_repository.dart';
// // import '../../controller/provider_controller.dart';
// //
// // class AboutSection extends StatelessWidget {
// //   final String providerId; // Provider ID for saving to the database
// //   final String initialBio; // The initial bio from the database
// //
// //   AboutSection({required this.providerId, required this.initialBio});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // Initialize the controller
// //     final ProviderController controller = Get.put(ProviderController());
// //
// //     // Load bio from Firebase using providerId if no initial bio is provided
// //     if (initialBio.isEmpty) {
// //       controller.loadBioFromFirebase(providerId);
// //     } else {
// //       controller.loadBio(initialBio);
// //     }
// //
// //     return Padding(
// //       padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Title and Edit Button
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 "About",
// //                 style: Theme.of(context).textTheme.headlineSmall,
// //               ),
// //               Obx(() => controller.providerBio.isNotEmpty
// //                   ? IconButton(
// //                 color: textColor,
// //                 onPressed: controller.toggleEdit,
// //                 icon: Icon(Icons.edit),
// //               )
// //                   : SizedBox.shrink()), // Only show Edit if bio is not empty
// //             ],
// //           ),
// //           SizedBox(height: Sizes.s),
// //
// //           // Display Bio or Add Bio Button
// //           Obx(() => controller.providerBio.isEmpty && !controller.isEditing.value
// //               ? Center(
// //             child: ElevatedButton(
// //               onPressed: controller.toggleEdit,
// //               child: const Text("Add Bio"),
// //             ),
// //           )
// //               : !controller.isEditing.value
// //               ? _buildBioCard(controller.providerBio.value)
// //               : _buildBioEditor(controller, providerId)),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Widget to display the bio inside a Card
// //   Widget _buildBioCard(String bio) {
// //     return SizedBox(
// //       width: double.infinity,
// //       child: Card(
// //         color: logoPurple.withOpacity(0.1),
// //         margin: EdgeInsets.only(bottom: 12),
// //         shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(15),
// //         ),
// //         elevation: 0,
// //         child: Padding(
// //           padding: EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 bio,
// //                 style: TextStyle(fontSize: 16),
// //               ),
// //               SizedBox(height: 10),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Widget to show the bio editor (TextField and buttons)
// //   Widget _buildBioEditor(ProviderController controller, String providerId) {
// //     final TextEditingController _bioController =
// //     TextEditingController(text: controller.providerBio.value);
// //
// //     return Column(
// //       children: [
// //         TextField(
// //           controller: _bioController,
// //           maxLines: 4,
// //           style: TextStyle(fontSize: 14),
// //           decoration: InputDecoration(
// //             labelText: "Enter your bio",
// //             border: OutlineInputBorder(),
// //           ),
// //         ),
// //         SizedBox(height: 10),
// //         Row(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
// //             ElevatedButton(
// //               onPressed: controller.toggleEdit,
// //               child: Text("Cancel"),
// //             ),
// //             SizedBox(width: 10),
// //             ElevatedButton(
// //               onPressed: () {
// //                 controller.saveBio(_bioController.text, providerId);
// //               },
// //               child: Text("Save"),
// //             ),
// //           ],
// //         ),
// //       ],
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet/constants/sizes.dart';
// import 'package:pet/constants/colors.dart';
// import '../../controller/provider_controller.dart';
//
// class AboutSection extends StatelessWidget {
//   final String providerId; // Provider ID for saving to the database
//   final String initialBio; // The initial bio from the database
//
//   AboutSection({required this.providerId, required this.initialBio});
//
//   @override
//   Widget build(BuildContext context) {
//     final ProviderController controller = Get.put(ProviderController());
//
//     // Load bio from Firebase using providerId
//     if (initialBio.isEmpty) {
//       controller.loadBioFromFirebase(providerId);
//     } else {
//       controller.loadBio(initialBio);
//     }
//
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "About",
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               Obx(() => controller.providerBio.isNotEmpty
//                   ? IconButton(
//                 color: textColor,
//                 onPressed: controller.toggleEdit,
//                 icon: Icon(Icons.edit),
//               )
//                   : SizedBox.shrink()),
//             ],
//           ),
//           SizedBox(height: Sizes.s),
//           Obx(() => controller.providerBio.isEmpty && !controller.isEditing.value
//               ? Center(
//             child: ElevatedButton(
//               onPressed: controller.toggleEdit,
//               child: const Text("Add Bio"),
//             ),
//           )
//               : !controller.isEditing.value
//               ? _buildBioCard(controller.providerBio.value)
//               : _buildBioEditor(controller, providerId)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildBioCard(String bio) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         color: logoPurple.withOpacity(0.1),
//         margin: EdgeInsets.only(bottom: 12),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 0,
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 bio,
//                 style: TextStyle(fontSize: 16),
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildBioEditor(ProviderController controller, String providerId) {
//     final TextEditingController _bioController =
//     TextEditingController(text: controller.providerBio.value);
//
//     return Column(
//       children: [
//         TextField(
//           controller: _bioController,
//           maxLines: 4,
//           style: TextStyle(fontSize: 14),
//           decoration: InputDecoration(
//             labelText: "Enter your bio",
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             ElevatedButton(
//               onPressed: controller.toggleEdit,
//               child: Text("Cancel"),
//             ),
//             SizedBox(width: 10),
//             ElevatedButton(
//               onPressed: () {
//                 controller.saveBio(_bioController.text, providerId);
//               },
//               child: Text("Save"),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//

// about_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/constants/sizes.dart';
import 'package:pet/constants/colors.dart';
import '../../controller/provider_controller.dart';

class AboutSection extends StatelessWidget {
  final String providerId; // Provider ID for saving to the database
  final String initialBio; // The initial bio from the database

  const AboutSection({super.key, required this.providerId, required this.initialBio});

  @override
  Widget build(BuildContext context) {
    final ProviderController controller = Get.put(ProviderController());

    // Load bio from Firebase using providerId if initialBio is empty
    if (initialBio.isEmpty) {
      controller.loadBioFromFirebase(providerId);
    } else {
      controller.loadBio(initialBio);
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "About",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Obx(() => controller.providerBio.isNotEmpty
                  ? IconButton(
                color: textColor,
                onPressed: controller.toggleEdit,
                icon: const Icon(Icons.edit),
              )
                  : const SizedBox.shrink()),
            ],
          ),
          SizedBox(height: Sizes.s),
          Obx(() => controller.providerBio.isEmpty && !controller.isEditing.value
              ? Center(
            child: ElevatedButton(
              onPressed: controller.toggleEdit,
              child: const Text("Add Bio"),
            ),
          )
              : !controller.isEditing.value
              ? _buildBioCard(controller.providerBio.value)
              : _buildBioEditor(controller, providerId)),
        ],
      ),
    );
  }

  Widget _buildBioCard(String bio) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: logoPurple.withOpacity(0.1),
        margin: const EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bio,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBioEditor(ProviderController controller, String providerId) {
    final TextEditingController bioController =
    TextEditingController(text: controller.providerBio.value);

    return Column(
      children: [
        TextField(
          controller: bioController,
          maxLines: 4,
          style: const TextStyle(fontSize: 14),
          decoration: const InputDecoration(
            labelText: "Enter your bio",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                controller.toggleEdit(); // Close the editor
                bioController.clear(); // Clear the text field if needed
              },
              child: const Text("Cancel"),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                controller.saveBio(bioController.text, providerId);
                controller.toggleEdit(); // Close the editor after saving
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ],
    );
  }
}
