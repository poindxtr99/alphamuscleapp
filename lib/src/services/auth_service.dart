import "package:flutter/material.dart";
import "package:realm/realm.dart";
import "dart:async";
import "package:alphamuscle/src/realm/app_services.dart";
import 'package:provider/provider.dart';


class AuthService with ChangeNotifier {
  static User? _user;
  Timer? timer;

  bool get isLoggedIn => _user != null;

  AuthService();

  static Future<void> login(BuildContext context, String email, String password) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    _user = await appServices.logInUserEmailPassword(email, password);
  }

  static Future<void> signUp(BuildContext context, String email, String password) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    _user = await appServices.registerUserEmailPassword(email, password);
  }

  Future<void> logout(BuildContext context) async {
    final appServices = Provider.of<AppServices>(context, listen: false);
    await appServices.logOutUser();
    _user = null;
    notifyListeners();
  }
}