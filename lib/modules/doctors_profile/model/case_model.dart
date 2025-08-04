class CaseModel {
  final String id;
  final String status;

  CaseModel({required this.id, required this.status});

  factory CaseModel.fromJson(Map<String, dynamic> json) {
    return CaseModel(
      id: json['id'],
      status: json['status'],
    );
  }
}