import 'package:GVPS/screens/home/homepage.dart';
import 'package:GVPS/screens/home/profile.dart';

import 'package:flutter/material.dart';
import 'package:GVPS/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String uid = 'NULL', url, name = 'Name';
  final AuthService _authService = AuthService();

  @override
  void initState() {
    _authService.getCurrentUser().then((data) {
      setState(() {
        url = data['3'];
        name = data['2'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
        title: Text(
          'G.V.P.S',
          style: TextStyle(
              letterSpacing: 3.0, fontSize: 30.0, color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: FlatButton(
              color: Colors.white,
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              shape: CircleBorder(side: BorderSide(style: BorderStyle.solid)),
              child: url == null ? Icon(Icons.person) : Image.network(url),
              clipBehavior: Clip.antiAlias,
            ),
          ),
        ],
      ),
      body: HomePage(),
    );
  }
}
