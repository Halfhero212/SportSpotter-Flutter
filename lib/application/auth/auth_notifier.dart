import 'package:flutter/widgets.dart';
import 'auth_model.dart';

class AuthNotifier extends ChangeNotifier {
  AuthModel? _authModel;

  AuthModel? get authModel => _authModel;

  void login(AuthModel authModel) {
    _authModel = authModel;
    // Add your authentication logic here.
    notifyListeners();
  }
}
