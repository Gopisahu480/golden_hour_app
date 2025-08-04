// lib/models/doctor_model.dart
class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String email;
  final String phone;
  final String hospitalId;
  final String profileImage;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.email,
    required this.phone,
    required this.hospitalId,
    required this.profileImage,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      email: json['email'],
      phone: json['phone'],
      hospitalId: json['hospitalId'],
      profileImage: json['profileImage'],
    );
  }
}

// lib/models/case_model.dart
class MedicalCase {
  final String id;
  final String patientName;
  final String caseType;
  final String status; // 'active' or 'completed'
  final DateTime admissionDate;
  final DateTime? dischargeDate;
  final String assignedDoctorId;
  final String hospitalId;

  MedicalCase({
    required this.id,
    required this.patientName,
    required this.caseType,
    required this.status,
    required this.admissionDate,
    this.dischargeDate,
    required this.assignedDoctorId,
    required this.hospitalId,
  });

  factory MedicalCase.fromJson(Map<String, dynamic> json) {
    return MedicalCase(
      id: json['id'],
      patientName: json['patientName'],
      caseType: json['caseType'],
      status: json['status'],
      admissionDate: DateTime.parse(json['admissionDate']),
      dischargeDate: json['dischargeDate'] != null ? DateTime.parse(json['dischargeDate']) : null,
      assignedDoctorId: json['assignedDoctorId'],
      hospitalId: json['hospitalId'],
    );
  }
}

// lib/models/hospital_stats_model.dart
class HospitalStats {
  final int totalDoctors;
  final int activeCases;
  final int completedCases;
  final String hospitalName;

  HospitalStats({
    required this.totalDoctors,
    required this.activeCases,
    required this.completedCases,
    required this.hospitalName,
  });

  factory HospitalStats.fromJson(Map<String, dynamic> json) {
    return HospitalStats(
      totalDoctors: json['totalDoctors'],
      activeCases: json['activeCases'],
      completedCases: json['completedCases'],
      hospitalName: json['hospitalName'],
    );
  }
}