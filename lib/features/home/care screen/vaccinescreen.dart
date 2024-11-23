import 'package:flutter/material.dart';
import 'package:pet/constants/images.dart';
import 'package:pet/constants/sizes.dart';
import 'package:pet/features/personalization/controller/user_controller.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../widgets/card.dart';
import 'booking_screen/Booking_screen.dart';


class VaccinationScreen extends StatefulWidget {
  const VaccinationScreen({super.key});

  @override
  _VaccinationScreenState createState() => _VaccinationScreenState();
}
 
class _VaccinationScreenState extends State<VaccinationScreen> {

  final controller = UserController.instance;
  
  String? selectedPet;
  int currentPageIndex = 0;
  int catClickCount = 0; // Counter for Cat clicks
  int dogClickCount = 0; // Counter for Dog clicks
  int rabbitClickCount = 0;
  bool isCatLoading = false;  // Track loading state for Cat
  bool isDogLoading = false;  // Track loading state for Dog
  bool isRabbitLoading = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccination Service', style: TextStyle(color: textColor, fontWeight: FontWeight.w500),),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                      Container(
                        height: 200,
                        width: double.infinity, // Use double.infinity to fit the container width
                        decoration: BoxDecoration(
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
                          image: AssetImage(vaccination),
                          fit: BoxFit.cover, // Ensure the image fits the container
                        ),
                      ),
                      SizedBox(height: Sizes.m),
                      Text('Select Pet Type', style: Theme.of(context).textTheme.headlineSmall),
                      SizedBox(height: Sizes.s),
                      RichText(
                        text: const TextSpan(
                          text: 'Note: ', style: TextStyle(color: Colors.red,fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Selecting a pet type helps us provide the most relevant vaccination tips for your pet.',style: body
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: Sizes.m),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isCatLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'cat';
                                  catClickCount++;
                                  isCatLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Cat)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ), // End of BoxDecoration (Cat)
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(cat),
                                  ), // End of CircleAvatar (Cat)
                                  if (isCatLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ), // End of CircularProgressIndicator (Cat)
                                ], // End of children in Stack (Cat)
                              ), // End of Stack (Cat)
                            ), // End of Container (Cat)
                          ), // End of GestureDetector (Cat)
                          const SizedBox(width: 15), // Add spacing between pet icons
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isDogLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'dog';
                                  dogClickCount++;
                                  isDogLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Dog)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(dog),
                                  ), // End of CircleAvatar (Dog)
                                  if (isDogLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ),
                                ], // End of children in Stack (Dog)
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isRabbitLoading = true; // Show loading indicator
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  selectedPet = 'rabbit';
                                  rabbitClickCount++;
                                  isRabbitLoading = false; // Hide loading indicator
                                });
                              });
                            }, // End of onTap (Rabbit)
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 4,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ), // End of BoxDecoration (Rabbit)
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    maxRadius: 45.0,
                                    backgroundImage: AssetImage(rabbit),
                                  ), // End of CircleAvatar (Rabbit)
                                  if (isRabbitLoading)
                                    const CircularProgressIndicator(
                                      color: Colors.purple,
                                    ), // End of CircularProgressIndicator (Rabbit)
                                ], // End of children in Stack (Rabbit)
                              ), // End of Stack (Rabbit)
                            ), // End of Container (Rabbit)
                          ), // End of GestureDetector (Rabbit)
                        ], // End of children in Row
                      ),
                      const SizedBox(height: 20),
                      if (selectedPet != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 150, // Fixed height for ListView
                              child: buildPetTips(selectedPet!),
                            ),
                          ],
                        ),
                      SizedBox(height: Sizes.defaultPadding),
                      Text('Nearby Service Providers', style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(height: Sizes.defaultPadding),
                      const PetClinicCard(clinicName:'Family Pet Clinic Isb ', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Aliyan Pets Hospital', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'The Pets Hopital Islamabad', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Alpha Pet care', location: 'Islamabad', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'MS Pet Clinic', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Meow pet Clinic', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      const SizedBox(height: 10),
                      const PetClinicCard(clinicName:'Veterinary Clinic ', location: 'RawalPindi', imagePath: 'assets/vaccineclinic.jpg', targetScreen: bookscreen1()),
                      ProviderCard(providerName: controller.user.value.fullName, serviceName: 'Bathing', rating: '7', picture: vaccination,),





                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget buildPetTips(String petType) {
    List<String> tips = [];

    switch (petType) {
      case 'cat':
        tips = catClickCount % 3 == 0
            ? [
          "1. Keep your cat calm before vaccination.",
          "2. Ensure your cat is healthy and not under stress.",
          "3. Monitor your cat for any side effects post-vaccination.",
          "4. Schedule annual booster vaccinations to maintain immunity.",
          "5. Give your cat a comfortable space to rest after vaccination.",
        ]
            : catClickCount % 3 == 1
            ? [
          "1. Make sure your cat has not had any recent illnesses before vaccination.",
          "2. Keep your cat hydrated before and after the vaccination process.",
          "3. Consult your vet about multi-vaccine shots if required.",
          "4. Vaccinate your cat at an early age for best results.",
          "5. Watch for any unusual behavior post-vaccination and consult your vet if needed.",
        ]
            : [
          "1. Cats may experience mild fever after vaccination.",
          "2. Keep your cat indoors for a few days post-vaccination.",
          "3. Ensure proper diet to boost your cat’s immune system.",
          "4. Schedule a follow-up appointment if your cat shows any symptoms.",
          "5. Avoid stressful activities for your cat after vaccination.",
        ];
        break;

      case 'dog':
        tips = dogClickCount % 3 == 0
            ? [
          "1. Give your dog a treat after the vaccination to keep them happy.",
          "2. Ensure your dog is up to date with its vaccination schedule.",
          "3. Provide fresh water and a cozy space post-vaccination.",
          "4. Avoid strenuous activities for your dog for a day after the vaccination.",
          "5. Ensure your dog is well-exercised before the vet visit.",
        ]
            : dogClickCount % 3 == 1
            ? [
          "1. Keep your dog active post-vaccination to minimize discomfort.",
          "2. Follow your vet’s instructions for post-vaccination care.",
          "3. Monitor your dog for any allergic reactions after vaccination.",
          "4. Make sure your dog stays hydrated after vaccination.",
          "5. Schedule annual vaccinations to keep your dog protected.",
        ]
            : [
          "1. Avoid taking your dog to crowded places immediately after vaccination.",
          "2. Plan a calm day at home after vaccination for your dog.",
          "3. Provide soft bedding for your dog to rest after the vaccination.",
          "4. Vaccinate puppies early to help build a strong immune system.",
          "5. Consult your vet if your dog shows signs of discomfort post-vaccination.",
        ];
        break;

      case 'rabbit':
        tips = rabbitClickCount % 3 == 0
            ? [
          "1. Rabbits are sensitive to temperature changes post-vaccination.",
          "2. Keep your rabbit in a calm and quiet environment post-vaccination.",
          "3. Provide fresh vegetables to keep your rabbit healthy after vaccination.",
          "4. Monitor your rabbit for any changes in behavior post-vaccination.",
          "5. Make sure your rabbit has a clean space to rest.",
        ]
            : rabbitClickCount % 3 == 1
            ? [
          "1. Ensure your rabbit has a balanced diet to support its immune system.",
          "2. Schedule regular vet checkups to ensure your rabbit’s long-term health.",
          "3. Avoid any stressful situations for your rabbit post-vaccination.",
          "4. Check your rabbit for any swelling or redness after vaccination.",
          "5. Keep your rabbit indoors for a few days after the vaccination.",
        ]
            : [
          "1. Vaccinate your rabbit against common diseases like myxomatosis.",
          "2. Provide a warm and quiet area for your rabbit after vaccination.",
          "3. Rabbits can be sensitive to vaccines, so consult your vet if any side effects occur.",
          "4. Keep your rabbit hydrated post-vaccination for quicker recovery.",
          "5. Make sure to follow up with booster shots as recommended by your vet.",
        ];
        break;
    }

    return ListView.builder(
      itemCount: tips.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tips[index],
            style: body,
          ),
        );
      },
    );
  }

}
class PetClinicCard extends StatelessWidget {
  final String clinicName;
  final String location;
  final String imagePath;
  final Widget targetScreen;

  const PetClinicCard({super.key, 
    required this.clinicName,
    required this.location,
    required this.imagePath,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 4,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    clinicName,
                    style:heading2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      return const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 16.0,
                      );
                    }),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: 'Location: ',
                      style: bodybold,
                      children: <TextSpan>[
                        TextSpan(
                          text: location,
                          style:body,
                        ),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  CustomElevatedButton(
                    title: 'Book Now',
                    targetScreen: targetScreen,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

















