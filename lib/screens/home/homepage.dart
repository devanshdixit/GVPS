import 'package:GVPS/screens/home/classespages/classpage.dart';
import 'package:GVPS/services/studentData.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String totalStudents = '300';
  String classno2;
  int class1 = 0,
      class2 = 0,
      class3 = 0,
      class4 = 0,
      class5 = 0,
      class6 = 0,
      class7 = 0,
      class8 = 0,
      classno1 = 9;
  StudentData studentData = StudentData();
  final CollectionReference collectionReference =
      Firestore.instance.collection('GVPS');

  Future setStudentData() {
    return collectionReference.getDocuments();
  }

  @override
  void initState() {
    setStudentData().then((value) => {
          setState(() {
            totalStudents = value.documents.length.toString();
          })
        });
    studentData.getTotalCLass(1).then((value) {
      setState(() {
        class1 = value;
      });
    });
    studentData.getTotalCLass(2).then((value) {
      setState(() {
        class2 = value;
      });
    });
    studentData.getTotalCLass(3).then((value) {
      setState(() {
        class3 = value;
      });
    });
    studentData.getTotalCLass(4).then((value) {
      setState(() {
        class4 = value;
      });
    });
    studentData.getTotalCLass(5).then((value) {
      setState(() {
        class5 = value;
      });
    });
    studentData.getTotalCLass(6).then((value) {
      setState(() {
        class6 = value;
      });
    });
    studentData.getTotalCLass(7).then((value) {
      setState(() {
        class7 = value;
      });
    });
    studentData.getTotalCLass(8).then((value) {
      setState(() {
        class8 = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Image(
              image: AssetImage(
                'assets/gayatri.png',
              ),
              fit: BoxFit.fill,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Gayati Vidhyapeeth School',
                  style: TextStyle(
                      color: Colors.white, fontSize: 30.0, letterSpacing: 2.0),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Students:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 0,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    totalStudents,
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 1:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 1,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class1.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 2:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 2,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class2.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 3:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 3,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class3.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 4:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 4,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class4.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 5:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 5,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class5.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 6:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 6,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class6.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 7:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 7,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class7.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Class 8:',
                  style: TextStyle(
                      color: Colors.white, fontSize: 20.0, letterSpacing: 2.0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassPage(),
                        settings: RouteSettings(
                          arguments: 8,
                        ),
                      ),
                    );
                  },
                  color: Colors.grey[850],
                  child: Text(
                    class8.toString(),
                    style: style.copyWith(fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
