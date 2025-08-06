// // lib/services/doctor_service.dart
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import '../models/doctor_model.dart';

// class DoctorService extends GetxService {
//   static const String baseUrl = 'https://your-api-url.com/api';

//   Future<Doctor> getHeadDoctorProfile(String doctorId) async {
//     final response = await http.get(Uri.parse('$baseUrl/doctors/$doctorId'));
//     if (response.statusCode == 200) {
//       return Doctor.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load doctor profile');
//     }
//   }

//   Future<List<Doctor>> getDoctorsInHospital(String hospitalId) async {
//     final response = await http.get(Uri.parse('$baseUrl/hospitals/$hospitalId/doctors'));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => Doctor.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load doctors list');
//     }
//   }

//   Future<List<MedicalCase>> getHospitalCases(String hospitalId, {String? status}) async {
//     String url = '$baseUrl/hospitals/$hospitalId/cases';
//     if (status != null) {
//       url += '?status=$status';
//     }

//     final response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200) {
//       List<dynamic> data = json.decode(response.body);
//       return data.map((item) => MedicalCase.fromJson(item)).toList();
//     } else {
//       throw Exception('Failed to load cases');
//     }
//   }

//   Future<HospitalStats> getHospitalStats(String hospitalId) async {
//     final response = await http.get(Uri.parse('$baseUrl/hospitals/$hospitalId/stats'));
//     if (response.statusCode == 200) {
//       return HospitalStats.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load hospital stats');
//     }
//   }
// }

// lib/screen/head_doctor/services/doctor_service.dart
import 'package:get/get.dart';
import '../models/doctor_model.dart';

class DoctorService extends GetxService {
  // Mock data initialization
  Future<DoctorService> init() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    return this;
  }

  // Mock head doctor profile
  Future<Doctor> getHeadDoctorProfile(String doctorId) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    ); // Simulate network delay
    return Doctor(
      id: 'doc_001',
      name: 'Dr. Rajesh Sharma',
      specialty: 'Chief of Medicine',
      email: 'rajesh.sharma@hospital.com',
      phone: '9876543210',
      hospitalId: 'hosp_001',
      profileImage: 'https://randomuser.me/api/portraits/men/1.jpg',
    );
  }

  // Mock doctors list
  Future<List<Doctor>> getDoctorsInHospital(String hospitalId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      Doctor(
        id: 'doc_002',
        name: 'Dr. Priya Patel',
        specialty: 'Cardiology',
        email: 'priya.patel@hospital.com',
        phone: '9876543211',
        hospitalId: 'hosp_001',
        profileImage: 'https://randomuser.me/api/portraits/women/2.jpg',
      ),
      Doctor(
        id: 'doc_003',
        name: 'Dr. Amit Kumar',
        specialty: 'Neurology',
        email: 'amit.kumar@hospital.com',
        phone: '9876543212',
        hospitalId: 'hosp_001',
        profileImage: 'https://randomuser.me/api/portraits/men/3.jpg',
      ),
      Doctor(
        id: 'doc_004',
        name: 'Dr. Neha Gupta',
        specialty: 'Pediatrics',
        email: 'neha.gupta@hospital.com',
        phone: '9876543213',
        hospitalId: 'hosp_001',
        profileImage: 'https://randomuser.me/api/portraits/women/4.jpg',
      ),
    ];
  }

  // Mock cases data
  Future<List<MedicalCase>> getHospitalCases(
    String hospitalId, {
    String? status,
  }) async {
    await Future.delayed(const Duration(milliseconds: 700));

    final allCases = [
      MedicalCase(
        id: 'case_001',
        patientName: 'Rahul Verma',
        caseType: 'Cardiac Arrest',
        status: 'active',
        admissionDate: DateTime.now().subtract(const Duration(days: 1)),
        assignedDoctorId: 'doc_002',
        hospitalId: 'hosp_001',
      ),
      MedicalCase(
        id: 'case_002',
        patientName: 'Sunita Devi',
        caseType: 'Stroke',
        status: 'completed',
        admissionDate: DateTime.now().subtract(const Duration(days: 3)),
        dischargeDate: DateTime.now().subtract(const Duration(days: 1)),
        assignedDoctorId: 'doc_003',
        hospitalId: 'hosp_001',
      ),
      MedicalCase(
        id: 'case_003',
        patientName: 'Arjun Singh',
        caseType: 'Pneumonia',
        status: 'active',
        admissionDate: DateTime.now().subtract(const Duration(hours: 12)),
        assignedDoctorId: 'doc_004',
        hospitalId: 'hosp_001',
      ),
      MedicalCase(
        id: 'case_004',
        patientName: 'Meena Kumari',
        caseType: 'Fracture',
        status: 'completed',
        admissionDate: DateTime.now().subtract(const Duration(days: 5)),
        dischargeDate: DateTime.now().subtract(const Duration(days: 2)),
        assignedDoctorId: 'doc_002',
        hospitalId: 'hosp_001',
      ),
       MedicalCase(
        id: 'case_006',
        patientName: 'Rani S',
        caseType: 'Pneumonia',
        status: 'active',
        admissionDate: DateTime.now().subtract(const Duration(days: 10)),
        assignedDoctorId: 'doc_004',
        hospitalId: 'hosp_001',
      ),
       MedicalCase(
        id: 'case_007',
        patientName: 'Neha',
        caseType: 'Pneumonia',
        status: 'completed',
        admissionDate: DateTime.now().subtract(const Duration(days: 10)),
        assignedDoctorId: 'doc_004',
        hospitalId: 'hosp_001',
      ),
      
  MedicalCase(
    id: 'case_201',
    patientName: 'Neha',
    caseType: 'Pneumonia',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 10)),
    dischargeDate: DateTime.now().subtract(Duration(days: 7)),
    assignedDoctorId: 'doc_004',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_202',
    patientName: 'Sunita Devi',
    caseType: 'Stroke',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 9)),
    dischargeDate: DateTime.now().subtract(Duration(days: 6)),
    assignedDoctorId: 'doc_003',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_203',
    patientName: 'Meena Kumari',
    caseType: 'Fracture',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 8)),
    dischargeDate: DateTime.now().subtract(Duration(days: 5)),
    assignedDoctorId: 'doc_002',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_204',
    patientName: 'Ayesha Khan',
    caseType: 'Malaria',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 7)),
    dischargeDate: DateTime.now().subtract(Duration(days: 4)),
    assignedDoctorId: 'doc_005',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_205',
    patientName: 'Gopal Das',
    caseType: 'Tuberculosis',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 6)),
    dischargeDate: DateTime.now().subtract(Duration(days: 3)),
    assignedDoctorId: 'doc_001',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_206',
    patientName: 'Vinod Rao',
    caseType: 'COVID-19',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 5)),
    dischargeDate: DateTime.now().subtract(Duration(days: 2)),
    assignedDoctorId: 'doc_003',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_207',
    patientName: 'Harshita R',
    caseType: 'Dengue',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 4)),
    dischargeDate: DateTime.now().subtract(Duration(days: 1)),
    assignedDoctorId: 'doc_002',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_208',
    patientName: 'Rajesh B',
    caseType: 'Migraine',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 3)),
    dischargeDate: DateTime.now().subtract(Duration(days: 1)),
    assignedDoctorId: 'doc_004',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_209',
    patientName: 'Preeti S',
    caseType: 'Low BP',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 2)),
    dischargeDate: DateTime.now().subtract(Duration(days: 1)),
    assignedDoctorId: 'doc_001',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_210',
    patientName: 'Santosh D',
    caseType: 'Skin Infection',
    status: 'completed',
    admissionDate: DateTime.now().subtract(Duration(days: 1)),
    dischargeDate: DateTime.now(),
    assignedDoctorId: 'doc_005',
    hospitalId: 'hosp_001',
  ),
 
  MedicalCase(
    id: 'case_101',
    patientName: 'Amit Sharma',
    caseType: 'Asthma',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 20)),
    assignedDoctorId: 'doc_005',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_102',
    patientName: 'Sita Ram',
    caseType: 'Dengue',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 15)),
    assignedDoctorId: 'doc_002',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_103',
    patientName: 'Kiran Gupta',
    caseType: 'COVID-19',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 12)),
    assignedDoctorId: 'doc_003',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_104',
    patientName: 'Manoj Yadav',
    caseType: 'Pneumonia',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 10)),
    assignedDoctorId: 'doc_004',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_105',
    patientName: 'Rani S',
    caseType: 'Pneumonia',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 10)),
    assignedDoctorId: 'doc_004',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_106',
    patientName: 'Arjun Singh',
    caseType: 'Pneumonia',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(hours: 12)),
    assignedDoctorId: 'doc_004',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_107',
    patientName: 'Rahul Verma',
    caseType: 'Cardiac Arrest',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(days: 1)),
    assignedDoctorId: 'doc_002',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_108',
    patientName: 'Rohit Khanna',
    caseType: 'Kidney Stone',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(hours: 8)),
    assignedDoctorId: 'doc_001',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_109',
    patientName: 'Payal D',
    caseType: 'High Fever',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(hours: 6)),
    assignedDoctorId: 'doc_002',
    hospitalId: 'hosp_001',
  ),
  MedicalCase(
    id: 'case_110',
    patientName: 'Imran Sheikh',
    caseType: 'Burn Injury',
    status: 'active',
    admissionDate: DateTime.now().subtract(Duration(hours: 2)),
    assignedDoctorId: 'doc_003',
    hospitalId: 'hosp_001',
  ),


    ];

    if (status != null) {
      return allCases.where((c) => c.status == status).toList();
    }
    return allCases;
  }

  // Mock hospital stats
  Future<HospitalStats> getHospitalStats(String hospitalId) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return HospitalStats(
      totalDoctors: 15,
      activeCases: 8,
      completedCases: 42,
      hospitalName: 'City General Hospital',
    );
  }
}
