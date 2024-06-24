import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class AppServices with ChangeNotifier {
  String id;
  Uri baseUrl;
  App app;
  User? currentUser;
  final storage = const FlutterSecureStorage();

  AppServices(this.id, this.baseUrl) : app = App(AppConfiguration(id, baseUrl: baseUrl)){
    _checkExistingToken();
  }

  Future<void> _checkExistingToken() async{
    String? token = await storage.read(key: 'authToken');
    if (token != null) {
      try{
        
      } catch(e){
        //Remove bad token
        await storage.delete(key: 'authToken');
      }
    }
  }

// Sign In
  Future<User> logInUserEmailPassword(String email, String password) async {
    User loggedInUser = await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    if (currentUser != null) {
      await storage.write(key: 'authToken', value: currentUser?.accessToken);
      notifyListeners();
    }
    return loggedInUser;
  }

// Sign Up
  Future<User> registerUserEmailPassword(String email, String password) async {
    EmailPasswordAuthProvider authProvider = EmailPasswordAuthProvider(app);
    await authProvider.registerUser(email, password);
    User loggedInUser = await app.logIn(Credentials.emailPassword(email, password));
    currentUser = loggedInUser;
    notifyListeners();
    return loggedInUser;
  }

// Sign Out
  Future<void> logOutUser() async {
    await currentUser?.logOut();
    await storage.delete(key: 'authToken');
    currentUser = null;
  }
}
