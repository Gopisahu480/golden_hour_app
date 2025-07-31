// // lib/controllers/head_doctor_controller.dart
// import 'package:get/get.dart';
// import '../models/doctor_model.dart';
// import '../services/doctor_service.dart';

// class HeadDoctorController extends GetxController {
//   final DoctorService _doctorService = Get.find();

//   var isLoading = true.obs;
//   var headDoctor = Doctor(
//     id: '',
//     name: '',
//     specialty: '',
//     email: '',
//     phone: '',
//     hospitalId: '',
//     profileImage: '',
//   ).obs;
  
//   var doctorsList = <Doctor>[].obs;
//   var activeCases = <MedicalCase>[].obs;
//   var completedCases = <MedicalCase>[].obs;
//   var hospitalStats = HospitalStats(
//     totalDoctors: 0,
//     activeCases: 0,
//     completedCases: 0,
//     hospitalName: '',
//   ).obs;

//   @override
//   void onInit() {
//     super.onInit();
//     loadData();
//   }

//   Future<void> loadData() async {
//     try {
//       isLoading(true);
      
//       // Assuming we have the head doctor's ID stored somewhere (like in GetStorage)
//       final headDoctorId = '123'; // Replace with actual ID retrieval logic
      
//       // Fetch head doctor profile
//       headDoctor.value = await _doctorService.getHeadDoctorProfile(headDoctorId);
      
//       // Fetch other data in parallel
//       final results = await Future.wait([
//         _doctorService.getDoctorsInHospital(headDoctor.value.hospitalId),
//         _doctorService.getHospitalCases(headDoctor.value.hospitalId, status: 'active'),
//         _doctorService.getHospitalCases(headDoctor.value.hospitalId, status: 'completed'),
//         _doctorService.getHospitalStats(headDoctor.value.hospitalId),
//       ]);
      
//       doctorsList.assignAll(results[0] as List<Doctor>);
//       activeCases.assignAll(results[1] as List<MedicalCase>);
//       completedCases.assignAll(results[2] as List<MedicalCase>);
//       hospitalStats.value = results[3] as HospitalStats;
      
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to load data: $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   void refreshData() async {
//     await loadData();
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