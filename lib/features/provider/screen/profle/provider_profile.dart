import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pet/constants/sizes.dart';

import '../../../../common/widgets/circular_image/circular_image.dart';
import '../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../constants/images.dart';
import '../../../personalization/controller/user_controller.dart';


class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Container(
      padding: EdgeInsets.all(Sizes.defaultPadding),
      child: Row(
        children: [
          Obx((){
            final networkImage = controller.user.value.profilePicture;
            final image = networkImage.isNotEmpty ? networkImage : avatar;
            return controller.imageUploading.value
                ? const ShimmerEffect(width: 100, height: 100, radius: 80,)
                : CircularImage(image: image, width: 100, height: 100, isNetworkImage: networkImage.isNotEmpty, padding: 0,);
          }),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 8),
              Row(
                children: [
                  Text("35 Rating 1 Review", style: TextStyle(color: Colors.grey, fontSize: 15)),
                ],
              ),
              SizedBox(height: 8),
              Text("Rawalpindi", style: TextStyle(color: Colors.grey, fontSize: 15)),
            ],
          )
        ],
      ),
    );
  }
}
