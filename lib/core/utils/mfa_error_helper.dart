import 'package:dio/dio.dart';

class ErrorHelper {
  static String parse(Object error) {
    if (error is DioException) {
      final data = error.response?.data;

      // ✅ Backend JSON: { "message": "Invalid code..." }
      if (data is Map<String, dynamic>) {
        final msg = data['message'];
        if (msg is String && msg.isNotEmpty) {
          return _humanize(msg);
        }
      }

      // fallback by status
      switch (error.response?.statusCode) {
        case 400:
          return "Invalid request. Please check your input.";
        case 401:
          return "Session expired. Please login again.";
        case 500:
          return "Server error. Please try again later.";
      }
    }

    return "Something went wrong. Please try again.";
  }

  static String _humanize(String message) {
    final m = message.toLowerCase();

    if (m.contains("invalid code")) {
      return "The code you entered is invalid. Please try again. If the issue persist, please contact your Administrator.";
    }

    if (m.contains("expired")) {
      return "This code has expired. Please enter a new one.";
    }

    return message;
  }
}
