import 'package:flutter/material.dart';
import 'package:pet/utils/helpers/helpers.dart';
import 'app_bar.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: HelpFunctions.screenWidth(),
              child: const MyAppBar(),
            )
          ],
        ),
      ),
    );
  }
}
