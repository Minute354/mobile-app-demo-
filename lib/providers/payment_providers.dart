// import 'package:flutter/material.dart';

// import '../servies/api_services.dart';


// class PaymentProvider with ChangeNotifier {
//   double _dueAmount = 0.0;

//   double get dueAmount => _dueAmount;

//   Future<void> fetchDueAmount(String studentId) async {
//     final response = await ApiService.getDueAmount(studentId);
//     _dueAmount = response['dueAmount'];
//     notifyListeners();
//   }
// }
