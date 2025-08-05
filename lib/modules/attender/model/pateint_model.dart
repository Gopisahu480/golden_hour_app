class Patient {
  final String name;
  final String gender;
  final int age;
  final List<String> bodyParts;
  final String severity;
  final String hospital;

  Patient({
    required this.name,
    required this.gender,
    required this.age,
    required this.bodyParts,
    required this.severity,
    required this.hospital,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'gender': gender,
        'age': age,
        'bodyParts': bodyParts,
        'severity': severity,
        'hospital': hospital,
      };

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
      bodyParts: List<String>.from(json['bodyParts']),
      severity: json['severity'],
      hospital: json['hospital'],
    );
  }
}
