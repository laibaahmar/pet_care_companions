import 'package:flutter/material.dart';
import 'package:pet/constants/sizes.dart';

import '../../../../constants/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("About", style: Theme.of(context).textTheme.headlineSmall,),
                IconButton( color: textColor, onPressed: () { }, icon: Icon(Icons.edit),)
              ],
            ),
            SizedBox(height: Sizes.s,),
            Card(
              color: logoPurple.withOpacity(0.1),
              margin: EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Hello! I\'m a passionate pet care provider with over 5 years of experience in grooming and training pets. My goal is to ensure your pets receive the best care possible. I love animals and enjoy spending time with them!',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Specialties: Grooming, Training, Walking',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

            )
          ],
        ),
    );
  }
}
