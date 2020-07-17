import 'package:GVPS/screens/authenticate/signin.dart';
import 'package:GVPS/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:GVPS/shared/loading.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final AuthService _authService = AuthService();
  String password = '', email = '', title = 'Signin to Brew Crew', error = '';
  Widget signin = SignIn();
  Color btncol1 = Colors.pink;
  Color btncol2 = Colors.pink;
  double bg1size = 1, bg2size = 1;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: bgcolor,
            appBar: AppBar(
              backgroundColor: bgbarcolor,
              elevation: 0.0,
              title: Text(title),
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlineButton(
                      onPressed: () async {
                        setState(() {
                          loading = true;
                        });
                        dynamic result = await _authService.signInWithGoogle();
                        if (result == null) {
                          setState(() {
                            error = 'please enter valid email or password';
                            loading = false;
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      highlightElevation: 0,
                      borderSide: BorderSide(color: Colors.blue),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(
                                image: AssetImage("assets/google_logo.png"),
                                height: 35.0),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Sign in with Google',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
