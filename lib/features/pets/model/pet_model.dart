class MedicalRecord {
  List<String> diseases;
  List<String> vaccinations;

  MedicalRecord({
    required this.diseases,
    required this.vaccinations,
  });

  Map<String, dynamic> toMap() {
    return {
      'diseases': diseases,
      'vaccinations': vaccinations,
    };
  }

  factory MedicalRecord.fromMap(Map<String, dynamic> data) {
    return MedicalRecord(
      diseases: List<String>.from(data['diseases'] ?? []),
      vaccinations: List<String>.from(data['vaccinations'] ?? []),
    );
  }
}

class Pet {
  String id;
  String name;
  String type;
  String breed;
  int age;
  String description;
  String imageUrl;
  MedicalRecord medicalRecord;

  Pet({
    required this.id,
    required this.name,
    required this.type,
    required this.breed,
    required this.age,
    required this.description,
    required this.imageUrl,
    required this.medicalRecord,
  });

  static Pet empty() => Pet(id: '', name: '', type: '', breed: '', age: 0, description: '', imageUrl: '', medicalRecord: MedicalRecord(diseases: [], vaccinations: []),);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'breed': breed,
      'age': age,
      'description': description,
      'imageUrl': imageUrl,
      'medicalRecord': medicalRecord.toMap(),
    };
  }

  factory Pet.fromMap(Map<String, dynamic> data) {
    return Pet(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      type: data['type'] ?? '',
      breed: data['breed'] ?? '',
      age: data['age'] ?? 0,
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      medicalRecord: MedicalRecord.fromMap(data['medicalRecord'] ?? {}),
    );
  }
}
