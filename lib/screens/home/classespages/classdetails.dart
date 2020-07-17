import 'package:GVPS/models/brew.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassDetails extends StatefulWidget {
  @override
  _ClassDetailsState createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Class Details',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 30.0,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Students:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'a',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Male:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '1',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Female:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '1',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Caste:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  '1',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                )
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
