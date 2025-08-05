// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'patient_model.dart';

// class PatientController extends GetxController {
//   var isLoading = false.obs;
//   var submittedPatient = Rxn<Patient>();

//   Future<void> submitPatient(Patient patient) async {
//     isLoading.value = true;
//     try {
//       final response = await http.post(
//         Uri.parse('https://5b8bbf97-914a-4818-a3df-1253c024427f.mock.pstmn.io/patient'),
//         body: jsonEncode(patient.toJson()),
//         headers: {'Content-Type': 'application/json'},
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         submittedPatient.value = Patient.fromJson(jsonDecode(response.body));
//       } else {
//         Get.snackbar("Error", "Submission failed!");
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }


import 'package:get/get.dart';
class NurseController extends GetxController {
  var name = ''.obs;
  var age = ''.obs;
  var gender = 'Male'.obs;
  var severity = 'Moderate'.obs;
  var selectedHospital = 'Raipur General Hospital'.obs;
  var referredHospital = 'Sunshine Hospital'.obs;
  
  var referredDoctor = 'Dr. Anand Patel'.obs;
  var referralReason = ''.obs;
  final referredPatientName = ''.obs;
  final referredPatientAge = ''.obs;
  final referredPatientGender = ''.obs;
  final referredConditionSummary = ''.obs;
  var selectedDoctor = ''.obs;
  var selectedDoctorPhone = ''.obs;
  final List<String> hospitals = [
    'Raipur General Hospital',
    'Apollo Hospital',
    'AIIMS',
  ];

  var selectedBodyParts = <String>[].obs;
  var selectedBodyPartsDisplay = <String>[].obs; // For display names
  
  void toggleBodyPart(String part) {
    if (selectedBodyParts.contains(part)) {
      selectedBodyParts.remove(part);
    } else {
      selectedBodyParts.add(part);
    }
  }
}