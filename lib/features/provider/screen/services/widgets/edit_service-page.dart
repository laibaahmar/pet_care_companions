import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/sizes.dart';
import '../../../controller/provider_controller.dart';
import '../../../model/service_model.dart';

class EditServicePage extends StatelessWidget {
  final ServiceModel service;
  final ProviderController controller = Get.find<ProviderController>(); // Use existing instance

  EditServicePage({required this.service}) {
    controller.initializeWithService(service); // Initialize fields with existing data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Service'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: InputDecoration(labelText: 'Service Name'),
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
                decoration: InputDecoration(labelText: 'Service Description'),
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
                decoration: InputDecoration(labelText: 'Price (Rs.)'),
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
                decoration: InputDecoration(labelText: 'Duration (minutes)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the service duration';
                  }
                  return null;
                },
              ),
              SizedBox(height: Sizes.s),

              Obx(() => SwitchListTile(
                title: Text('Service Available'),
                value: controller.isAvailable.value,
                onChanged: (value) {
                  controller.isAvailable.value = value;
                },
              )),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.updateService(service.serviceId, providerId: FirebaseAuth.instance.currentUser!.uid);
                  }
                },
                child: Text('Update Service'),
              ),
              SizedBox(height: Sizes.s*1.5,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.deleteService(service.serviceId, FirebaseAuth.instance.currentUser!.uid);
                  }
                },
                child: Text('Delete Service'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

