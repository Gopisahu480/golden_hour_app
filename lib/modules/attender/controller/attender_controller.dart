// import 'package:get/get.dart';

// class NurseController extends GetxController {
//   var name = ''.obs;
//   var age = ''.obs;
//   var gender = 'Male'.obs;
//   var severity = 'Moderate'.obs;
//   var selectedHospital = 'Raipur General Hospital'.obs;
//   var referredHospital = 'Sunshine Hospital'.obs;
  
// var referredDoctor = 'Dr. Anand Patel'.obs;
// var referralReason = ''.obs;
// final referredPatientName = ''.obs;
// final referredPatientAge = ''.obs;
// final referredPatientGender = ''.obs;
// final referredConditionSummary = ''.obs;

//   var selectedDoctor = ''.obs; // NEW

//   final List<String> hospitals = [
//     'Raipur General Hospital',
//     'Apollo Hospital',
//     'AIIMS',
//   ];

//   var selectedBodyParts = <String>[].obs;
  
//   void toggleBodyPart(String part) {
//     if (selectedBodyParts.contains(part)) {
//       selectedBodyParts.remove(part);
//     } else {
//       selectedBodyParts.add(part);
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