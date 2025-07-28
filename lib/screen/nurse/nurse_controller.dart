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

  var selectedDoctor = ''.obs; // NEW

  final List<String> hospitals = [
    'Raipur General Hospital',
    'Apollo Hospital',
    'AIIMS',
  ];
}
