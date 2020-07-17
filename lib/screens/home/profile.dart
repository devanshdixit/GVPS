import 'package:GVPS/services/auth.dart';
import 'package:flutter/material.dart';

import 'package:GVPS/shared/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final AuthService _authService = AuthService();
  String url, name = 'Name', phoneno = 'not available', email = '';

  Future setUserData() async {
    return _authService.getCurrentUser();
  }

  @override
  void initState() {
    setUserData().then((value) => {
          setState(() {
            url = value['3'];
            name = value['2'];
            phoneno = value['4'];
            email = value['5'];
            print(email);
          }),
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text(
          'G.V.P.S',
          style: TextStyle(letterSpacing: 3.0, fontSize: 30.0),
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          FlatButton(
            color: Colors.grey[850],
            onPressed: () async {
              await _authService.signOut().whenComplete(() {
                Navigator.pop(context);
              });
            },
            child: Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            clipBehavior: Clip.antiAlias,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton(
                color: Colors.white,
                onPressed: () {},
                shape: CircleBorder(
                    side: BorderSide(
                  style: BorderStyle.solid,
                )),
                child: url == null ? Icon(Icons.person) : Image.network(url),
                clipBehavior: Clip.antiAlias,
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: style.copyWith(
                  fontSize: 30.0,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                email == '' ? 'Email not available' : email,
                style: style.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                phoneno == '' ? 'Phone number not available' : phoneno,
                style: style.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
