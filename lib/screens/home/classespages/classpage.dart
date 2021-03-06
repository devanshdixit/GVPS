import 'package:GVPS/screens/home/classespages/classdetails.dart';
import 'package:GVPS/screens/home/classespages/classlist.dart';
import 'package:GVPS/services/studentData.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassPage extends StatefulWidget {
  @override
  _ClassPageState createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  @override
  Widget build(BuildContext context) {
    Text title;
    int classno = ModalRoute.of(context).settings.arguments;
    StudentData studentData = StudentData(classno: classno);
    if (classno == 0) {
      title = Text('All Students');
    } else {
      title = Text('Class $classno');
    }
    return StreamProvider.value(
      value: studentData.classesdata,
      catchError: (context, error) {
        print(error);
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: title,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: RaisedButton(
                color: Colors.grey[850],
                child: Text(
                  'Details',
                  style: style.copyWith(
                      fontSize: 20.0, backgroundColor: Colors.grey[900]),
                ),
                onPressed: () => showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return ClassDetails();
                    }),
              ),
            ),
          ],
        ),
        body: ClassList(),
      ),
    );
  }
}
