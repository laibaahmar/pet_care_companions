import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/constants/colors.dart';
import 'package:pet/constants/sizes.dart';
import '../../../controller/pdf_controller.dart';
import '../../../controller/provider_controller.dart';

class AddServicePage extends StatelessWidget {
  final ProviderController controller = Get.find<ProviderController>(); // Use existing instance
  final PdfController pdfController = Get.put(PdfController());

  AddServicePage({super.key}) {
    controller.clearForm(); // Clear fields when navigating to this page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: textColor,
        title: const Text('Add New Service', style: TextStyle(color: textColor, fontWeight: FontWeight.w500)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              SizedBox(height: Sizes.s),
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

              Center(
                child: GestureDetector(
                  onTap: () async {
                    await pdfController.pickPdfFile();
                  },
                  child: Container(
                    width: 300,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2),
                      color: Colors.grey[100],
                    ),
                    child: Obx(() => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.picture_as_pdf,
                          size: 50,
                          color: logoPurple,
                        ),
                        SizedBox(height: 10),
                        Text(
                          pdfController.fileName.value.isEmpty
                              ? 'Tap to upload PDF'
                              : pdfController.fileName.value,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: pdfController.fileName.value.isEmpty
                                ? Colors.grey
                                : Colors.black,
                            fontWeight: pdfController.fileName.value.isEmpty
                                ? FontWeight.normal
                                : FontWeight.bold,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
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
                onPressed: () async {
                  if (controller.formKey.currentState!.validate()) {
                    // Upload PDF first if selected
                    String? certificateUrl = pdfController.fileName.value.isNotEmpty
                        ? await pdfController.uploadCertificateToFirebase(
                      context,
                      pdfController.file!.path!,
                      pdfController.fileName.value, // PDF path or file
                    )
                        : null;

                    // Proceed to add service with certificate URL (if available)
                    controller.addService(
                      context,
                      providerId: FirebaseAuth.instance.currentUser?.uid,
                      certificateUrl: certificateUrl,
                    );
                  }
                },
                child: const Text('Add Service'),
              ),
              SizedBox(height: Sizes.s),

            ],
          ),
        ),
      ),
    );
  }
}

