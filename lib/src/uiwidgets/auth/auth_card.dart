import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AuthMode { signUp, signIn }

class AuthCard extends StatefulWidget {
  AuthMode? authMode;
  
  AuthCard({super.key, required AuthMode this.authMode});

  @override
  State<AuthCard> createState() => _AuthCardState();


  static Future<void> showAuthCard(BuildContext context, AuthMode initAuthMode) {
      return showDialog(
        context: context, 
        builder: (BuildContext context){
          return AuthCard(authMode: initAuthMode,);
      });
  }
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  
  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void _switchAuthMode() {
    _isLoading = false;
    if (widget.authMode == AuthMode.signUp) {
      setState(() {
        widget.authMode = AuthMode.signIn;
      });
    } else {
      setState(() {
        widget.authMode = AuthMode.signUp;
      });
    }
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    print ("AuthCard::_submit - response status code:");

    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    final url = Uri.https("b-alphamuscle-default-rtdb.firebaseio.com", 'test_users.json');
    try {
      final http.Response response = await http.post(url, headers: <String, String>{
        'Content-Type': 'application/json',
       }, body: jsonEncode(<String, String>{
        'username':_emailController.text,
        'password':_passwordController.text
       }));
      widget.authMode == AuthMode.signIn ? Navigator.of(context).pop() : _switchAuthMode();
    } catch(e) {
      print ("AuthCard::_submit - error: $e");
    }
  }

  @override
  Widget build(context) {
    final deviceSize = MediaQuery.of(context).size;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 8.0,
      child: Container(
        height: widget.authMode == AuthMode.signUp ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: widget.authMode == AuthMode.signUp ? 320 : 260, maxHeight: 350),
        width: deviceSize.width * 0.75,
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email:'),
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value as String;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 8) {
                      return 'Password length is too small';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value as String;
                  },
                ),
                if (widget.authMode == AuthMode.signUp)
                  TextFormField(
                    enabled: widget.authMode == AuthMode.signUp,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: widget.authMode == AuthMode.signUp
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                            return null;
                          }
                        : null,
                  ),
                const SizedBox(
                  // sizedbox for spacing
                  height: 20,
                ),
                if (_isLoading)
                  const CircularProgressIndicator()
                else
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text(
                        widget.authMode == AuthMode.signUp ? 'Sign Up' : 'Sign In'),
                  ),
                TextButton(
                    onPressed: _switchAuthMode,
                    child: Text(
                        '${widget.authMode == AuthMode.signUp ? 'Sign In' : 'Sign Up'} instead'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
