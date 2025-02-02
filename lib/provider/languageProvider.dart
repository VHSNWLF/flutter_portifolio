import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String _selectedLanguage = 'Português - BR'; // Valor inicial

  String get selectedLanguage => _selectedLanguage;

  void changeLanguage(String newLanguage) {
    _selectedLanguage = newLanguage;
    notifyListeners(); // Notifica os ouvintes (widgets) para atualizarem
  }
}