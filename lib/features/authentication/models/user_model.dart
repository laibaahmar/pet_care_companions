import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet/utils/formatters/formatters.dart';

import '../../provider/model/provider_model.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String username;
  final String email;
  String phoneNo;
  String profilePicture;
  ServiceProviderModel? serviceProvider;

  // Constructors
  UserModel({
   required this.id,
   required this.firstName,
   required this.lastName,
   required this.username,
   required this.email,
   required this.phoneNo,
   required this.profilePicture,
    this.serviceProvider,
  });

  // Helper Function for Full Name.
  String get fullName => '$firstName $lastName';

  //  Format Phone Number
  String get formatPhoneNumber => Formatters.formatPhoneNumber(phoneNo);

  // Function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  // Username from full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "pcc_$camelCaseUsername";
    return usernameWithPrefix;
  }

  // Function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNo: '', profilePicture: '');

  // Convert model to Json
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNo': phoneNo,
      'ProfilePicture': profilePicture,
      'ServiceProvider': serviceProvider?.toJson(),
    };
  }

  // Create User Model from Firebase Document
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        id: document.id,
        firstName: data?['FirstName'] ?? '',
        lastName: data?['LastName'] ?? '',
        username: data?['Username'] ?? '',
        email: data?['Email'] ?? '',
        phoneNo: data?['PhoneNumber'] ?? '',
        profilePicture: data?['ProfilePicture'] ?? '',
        serviceProvider: data?['ServiceProvider'] != null
            ? ServiceProviderModel.fromJson(data!['ServiceProvider'])
            : null,
      );
    } else {
      return UserModel.empty();
    }
  }
}