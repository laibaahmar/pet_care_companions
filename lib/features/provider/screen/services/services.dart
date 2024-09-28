import 'package:flutter/material.dart';
import 'package:pet/constants/colors.dart';
import 'package:pet/constants/sizes.dart';

class ServiceOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Sizes.defaultPadding, left: Sizes.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Services", style: Theme.of(context).textTheme.headlineSmall,),
          // Services Section
          SizedBox(height: Sizes.s*2),
          _buildServicesList(),
          SizedBox(height: 20),
          _buildAddServiceButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  // Builds the services list
  Widget _buildServicesList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2, // Number of services
      itemBuilder: (context, index) {
        return Card(
          color: logoPurple.withOpacity(0.1),
          margin: EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Service ${index + 1}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '\$20 | 30 minutes',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Switch(
                      value: true,
                      onChanged: (value) {
                        // Toggle availability action
                      },
                      activeColor: logoPurple,
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: logoPurple),
                      onPressed: () {
                        // Edit service action
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Builds the "Add New Service" button
  Widget _buildAddServiceButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Add new service action
        },
        icon: Icon(Icons.add),
        label: Text('Add New Service'),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
