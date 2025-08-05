// import 'package:get/get.dart';
// import 'doctor_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DoctorController extends GetxController {
//   var doctors = <Doctor>[].obs;
//   var hospitals = <String>[].obs;
//   var selectedHospital = ''.obs;
//   var showOnlyHeadDoctors = false.obs;
//   var filteredDoctors = <Doctor>[].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     fetchDoctors();
//     super.onInit();
//   }

//   void fetchDoctors() async {
//     try {
//       isLoading(true);
//       final response = await http.get(Uri.parse('https://5b8bbf97-914a-4818-a3df-1253c024427f.mock.pstmn.io/doctorslist'));
//       if (response.statusCode == 200) {
//         var doctorList = json.decode(response.body) as List;
//         doctors.value = doctorList.map((e) => Doctor.fromJson(e)).toList();
//         hospitals.value = doctors.map((d) => d.hospital).toSet().toList();

//         if (hospitals.isNotEmpty) {
//           selectedHospital.value = hospitals.first;
//           filterDoctors();
//         }
//       }
//     } finally {
//       isLoading(false);
//     }
//   }

//   void filterDoctors() {
//     var filtered = doctors.where((d) => d.hospital == selectedHospital.value);
//     if (showOnlyHeadDoctors.value) {
//       filtered = filtered.where((d) => d.isHeadDoctor);
//     }
//     filteredDoctors.value = filtered.toList();
//   }
// }

// lib/screen/head_doctor/controllers/head_doctor_controller.dart
import 'package:get/get.dart';
import '../models/doctor_model.dart';
import '../services/doctor_service.dart';

class HeadDoctorController extends GetxController {
  final DoctorService _doctorService = Get.find();

  var isLoading = true.obs;
  var headDoctor = Doctor(
    id: '',
    name: '',
    specialty: '',
    email: '',
    phone: '',
    hospitalId: '',
    profileImage: '',
  ).obs;
  
  var doctorsList = <Doctor>[].obs;
  var activeCases = <MedicalCase>[].obs;
  var completedCases = <MedicalCase>[].obs;
  var hospitalStats = HospitalStats(
    totalDoctors: 0,
    activeCases: 0,
    completedCases: 0,
    hospitalName: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      isLoading(true);
      
      // Using mock data - no need for actual doctor ID
      headDoctor.value = await _doctorService.getHeadDoctorProfile('');
      
      // Fetch all data in parallel
      final results = await Future.wait([
        _doctorService.getDoctorsInHospital(headDoctor.value.hospitalId),
        _doctorService.getHospitalCases(headDoctor.value.hospitalId, status: 'active'),
        _doctorService.getHospitalCases(headDoctor.value.hospitalId, status: 'completed'),
        _doctorService.getHospitalStats(headDoctor.value.hospitalId),
      ]);
      
      doctorsList.assignAll(results[0] as List<Doctor>);
      activeCases.assignAll(results[1] as List<MedicalCase>);
      completedCases.assignAll(results[2] as List<MedicalCase>);
      hospitalStats.value = results[3] as HospitalStats;
      
    } catch (e) {
      Get.snackbar('Error', 'Failed to load data: $e');
    } finally {
      isLoading(false);
    }
  }

  void refreshData() async {
    await loadData();
  }
}