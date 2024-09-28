import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/constants/colors.dart';
import 'package:pet/constants/images.dart';
import 'package:pet/features/provider/screen/home/provider_app_bar.dart';
import 'package:pet/features/provider/screen/reviews/reviews.dart';
import '../../../personalization/controller/user_controller.dart';
import '../about/about.dart';
import '../appointment/appointment.dart';
import '../earning/earning.dart';
import '../profle/provider_profile.dart';
import '../services/services.dart';

class ProviderHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      backgroundColor: logoPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProviderAppBar(), // Moved app bar here
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSection(),
                  SizedBox(height: 20),
                  AboutSection(),
                  SizedBox(height: 20),
                  ServiceOverview(),
                  SizedBox(height: 20),
                  AppointmentSection(),
                  SizedBox(height: 20),
                  EarningsOverview(),
                  SizedBox(height: 20),
                  ReviewsSection(),
                  // _buildReviewsSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}