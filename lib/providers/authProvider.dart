import 'package:flutter/material.dart';

import '../servies/api_services.dart';
import '../utils/sharedPreference_helper.dart';


class AuthProvider with ChangeNotifier {
  String _token = '';
  String _errorMessage = '';
  bool _isLoading = false;

  String get token => _token;
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final token = await SharedPreferencesHelper.getToken();
    if (token != null) {
      _token = token;
      notifyListeners();
    }
  }

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.signIn(email, password);
      if (response['success']) {
        _token = response['token'];
        await SharedPreferencesHelper.saveToken(_token);
        _errorMessage = '';
      } else {
        _errorMessage = response['message'] ?? 'Unknown error';
      }
    } catch (error) {
      _errorMessage = 'Failed to sign in. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await ApiService.signUp(email, password);
      if (response['success']) {
        _token = response['token'];
        await SharedPreferencesHelper.saveToken(_token);
        _errorMessage = '';
      } else {
        _errorMessage = response['message'] ?? 'Unknown error';
      }
    } catch (error) {
      _errorMessage = 'Failed to sign up. Please try again later.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    _token = '';
    await SharedPreferencesHelper.removeToken();
    notifyListeners();
  }
}
