import 'package:alphamuscle/src/realm/app_services.dart';
import 'package:alphamuscle/src/uiwidgets/auth/auth_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Consumer<AppServices>(
          builder:(context, appServices, _){
            if (appServices.currentUser != null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.account_circle_sharp, size: 148.0,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Olu's Profile".toUpperCase(), style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  OutlinedButton(onPressed: null, 
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ))
                  ),
                  child: Text("Edit Profile".toUpperCase()),),
                  Padding(padding: const EdgeInsets.all(25.0), child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft, 
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
                          child: Text("Friends", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),),
                      OutlinedButton(
                        onPressed: null, 
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 48)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)
                            )
                          )
                        ),
                        child: Text("Add Friends".toUpperCase()),
                        )
                    ],
                  ),)
                ],
              );
            } 
            else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.0, top: 10.0, left: 8.0, right: 8.0),
                    child: ElevatedButton(onPressed: () => AuthCard.showAuthCard(context, AuthMode.signUp), child: const Text("Sign Up")),
                  ),
                  TextButton(onPressed: () => AuthCard.showAuthCard(context, AuthMode.signIn), child: const Text("Sign In"))
                ],
              );}
      }),
      );
  }

  
}
