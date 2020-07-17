import 'package:GVPS/models/brew.dart';
import 'package:GVPS/screens/home/student/student.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:flutter/material.dart';

class ClassTile extends StatelessWidget {
  final ClassData classdata;
  ClassTile({this.classdata});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Card(
        color: Colors.grey[900],
        shadowColor: Colors.white70,
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Student(),
                settings: RouteSettings(
                  arguments: classdata.did,
                ),
              ),
            );
          },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                classdata.name,
                style: style.copyWith(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
