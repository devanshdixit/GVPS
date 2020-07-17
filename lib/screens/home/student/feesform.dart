import 'package:GVPS/models/brew.dart';

import 'package:GVPS/services/studentData.dart';
import 'package:GVPS/shared/loading.dart';
import 'package:GVPS/shared/constants.dart';
import 'package:flutter/material.dart';

class FeesForm extends StatefulWidget {
  final String did;
  FeesForm({this.did});
  @override
  _FeesFormState createState() => _FeesFormState(did: did);
}

class _FeesFormState extends State<FeesForm> {
  bool loading = false;
  final String did;
  _FeesFormState({this.did});

  String _totalfees, _paidfess, _remainingfees;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    StudentData studentData = StudentData(did: did);

    return StreamBuilder<ClassData>(
        stream: studentData.studentsdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ClassData data = snapshot.data;
            return Form(
              key: _formkey,
              child: Container(
                color: Colors.grey[850],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Update Fees Details!',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 25.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: data.totalfees,
                        keyboardType: TextInputType.number,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Total Fees',
                          labelText: 'Total Fees',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Enter Total Fees' : null,
                        onChanged: (value) =>
                            setState(() => _totalfees = value),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: data.paidfees,
                        keyboardType: TextInputType.number,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Fees Paid',
                          labelText: 'Paid Fees',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Enter Fees Paid' : null,
                        onChanged: (value) => setState(() => _paidfess = value),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        initialValue: data.totalfees,
                        keyboardType: TextInputType.number,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Fees Remaining',
                          labelText: 'Remaining Fees',
                          labelStyle: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        validator: (value) =>
                            value.isEmpty ? 'Enter Remaining Fees' : null,
                        onChanged: (value) =>
                            setState(() => _remainingfees = value),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                          color: Colors.grey[800],
                          child: Text(
                            loading ? Loading().toString() : 'Update',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              await StudentData().updateStudentFees(
                                did,
                                _totalfees ?? data.totalfees,
                                _paidfess ?? data.paidfees,
                                _remainingfees ?? data.remainingfees,
                              );
                              setState(() {
                                loading = false;
                              });
                              Navigator.pop(context);
                            }
                          }),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
