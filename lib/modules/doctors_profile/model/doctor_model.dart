class DoctorModel {
  final String id;
  final String name;
  final String specialty;

  DoctorModel({required this.id, required this.name, required this.specialty});

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
    );
  }
}