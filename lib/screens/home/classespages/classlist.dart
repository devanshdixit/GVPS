import 'package:GVPS/models/brew.dart';
import 'package:GVPS/screens/home/classespages/classtile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClassList extends StatefulWidget {
  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  int len = 0;
  @override
  Widget build(BuildContext context) {
    final classesdata = Provider.of<List<ClassData>>(context) ?? [];

    return ListView.builder(
        itemCount: len != null ? len = classesdata.length : 0,
        itemBuilder: (context, index) {
          return ClassTile(
            classdata: classesdata[index],
          );
        });
  }
}
