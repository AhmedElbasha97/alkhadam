import 'package:easy_localization/easy_localization.dart';

class Validation {
  /// Validates email input
  static String? validateEmail(String? value) {
    final normalized = value?.trim() ?? '';
    if (normalized.isEmpty) {
      return 'email_required'.tr(); // "Email is required"
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if (!emailRegex.hasMatch(normalized)) {
      return 'email_invalid'.tr(); // "Please enter a valid email address"
    }
    return null;
  }

  /// Validates password input
  static String? validatePassword(String? value) {
    final normalized = value?.trim() ?? '';
    if (normalized.isEmpty) {
      return 'password_required'.tr(); // "Password is required"
    }
    if (normalized.length < 6) {
      return 'password_length'.tr(); // "Password must be at least 6 characters"
    }
    return null;
  }

  /// Validates name input
  static String? validateName(String? value) {
    final normalized = value?.trim() ?? '';
    if (normalized.isEmpty) {
      return 'name_required'.tr(); // "Name is required"
    }
    if (normalized.length < 2) {
      return 'name_short'.tr(); // "Name must be at least 2 characters"
    }
    return null;
  }
}
