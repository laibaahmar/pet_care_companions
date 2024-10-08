import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';

class bookscreen1 extends StatefulWidget {
  const bookscreen1({super.key});

  @override
  State<bookscreen1> createState() => _bookscreen1State();
}

class _bookscreen1State extends State<bookscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class bookscreen2 extends StatefulWidget {
  const bookscreen2({super.key});

  @override
  State<bookscreen2> createState() => _bookscreen2State();
}

class _bookscreen2State extends State<bookscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookscreen3 extends StatefulWidget {
  const bookscreen3({super.key});

  @override
  State<bookscreen3> createState() => _bookscreen3State();
}

class _bookscreen3State extends State<bookscreen3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookscreen4 extends StatefulWidget {
  const bookscreen4({super.key});

  @override
  State<bookscreen4> createState() => _bookscreen4State();
}

class _bookscreen4State extends State<bookscreen4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookscreen5 extends StatefulWidget {
  const bookscreen5({super.key});

  @override
  State<bookscreen5> createState() => _bookscreen5State();
}

class _bookscreen5State extends State<bookscreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookscreen6 extends StatefulWidget {
  const bookscreen6({super.key});

  @override
  State<bookscreen6> createState() => _bookscreen6State();
}

class _bookscreen6State extends State<bookscreen6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookscreen7 extends StatefulWidget {
  const bookscreen7({super.key});

  @override
  State<bookscreen7> createState() => _bookscreen7State();
}

class _bookscreen7State extends State<bookscreen7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bckgndclryellow,
      appBar: AppBar(
        backgroundColor: bckgndclryellow,
        title: const Text('Booking screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            // Scrollable content
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Image and content
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.deepPurple),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 4,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                              color: backgrndclrpurple,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Image(
                              image: AssetImage('assets/care booking/familyclinic2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text('Services', style: heading2),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: const [
                              bulletpointss(point: 'Vaccination'),
                              bulletpointss(point: 'Deworming'),
                              bulletpointss(point: 'UltraSound'),
                              bulletpointss(point: 'Blood Test'),
                              bulletpointss(point: 'Grooming'),
                              bulletpointss(point: 'Pet Food'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Contact', style: heading2),
                          const SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text('123-456-7890', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.call, onPressed: () {}),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Text('email@example.com', style: body),
                                  const Spacer(),
                                  ButtonIcon(icon: Icons.email, onPressed: () {}),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Location', style: heading2),
                          const SizedBox(height: 10),
                          const Text(
                            'Shop 5, Block 89, Street 35, G10/1 Islamabad, Islamabad, Pakistan',
                            style: body,
                          ),
                          const SizedBox(height: 100), // Additional spacing to avoid overlapping the button
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // "Book Now" button fixed at the bottom, outside the container
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white, // Optional: can set a background color
                padding: const EdgeInsets.all(16.0),
                child: const CustomElevatedButton(
                  title: 'Book Now',
                  targetScreen: bookvaccine(),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

class bookvaccine extends StatelessWidget {
  const bookvaccine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
