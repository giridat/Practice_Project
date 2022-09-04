import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum UserType {
  // help with mapping string would be stored in local storage
  none('none'),
  guest('guest'),
  valid('valid');

  final String value;

  const UserType(this.value);

  static UserType fromString(String? currentType) {
    return UserType.values.firstWhere(
      (enums) => enums.value == currentType,
      orElse: () => none,
    );
  }
}

class Authentication extends ChangeNotifier {
  final SharedPreferences prefs;

  Authentication({required this.prefs}) {
    onFirstStart();
  }

  ValueKey<UserType?> userType = const ValueKey(null);
  ValueKey<String?> accessToken = const ValueKey(null);

  void onFirstStart() {
    //  Check the local storage for user type
    // add circular prog indicator
    final String? fromLocalStorage =
        prefs.getString('userType'); // reading local storage
    final currentUserType = UserType.fromString(fromLocalStorage);
    if (currentUserType == UserType.valid) {
      final String? currentToken = prefs.getString('accessToken');
      accessToken = ValueKey(currentToken);
    }
    userType = ValueKey(currentUserType);
    notifyListeners();
    return;
  }
}
