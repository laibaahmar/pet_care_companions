import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../provider/controller/service_controller.dart';
import '../../booking.dart';

class ServiceProvidersSection extends StatefulWidget {
  final ServiceController serviceController;

  const ServiceProvidersSection({required this.serviceController, Key? key}) : super(key: key);

  @override
  _ServiceProvidersSectionState createState() => _ServiceProvidersSectionState();
}

class _ServiceProvidersSectionState extends State<ServiceProvidersSection> {

  @override
  void initState() {
    super.initState();
    widget.serviceController.fetchPetCareServices('Litter Training');
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (widget.serviceController.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (widget.serviceController.services.isEmpty) {
        return const Center(child: Text("No services available"));
      }
      return ListView.builder(
        shrinkWrap: true,
        itemCount: widget.serviceController.services.length,
        itemBuilder: (context, index) {
          final service = widget.serviceController.services[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookingScreen(
                    name: service.name,
                    description: service.description,
                    price: service.price,
                    duration: service.durationInMinutes,
                    userName: service.user.fullName,
                    userEmail: service.user.email,
                  ),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(service.name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Description: ${service.description}'),
                    Text('Price: \$${service.price.toString()}'),
                    Text('Duration: ${service.durationInMinutes} mins'),
                    Text('User: ${service.user.fullName}'),
                    Text('User Email: ${service.user.email}'),
                  ],
                ),
                trailing: Icon(service.isAvailable ? Icons.check : Icons.close),
              ),
            ),
          );
        },
      );
    });
  }
}
