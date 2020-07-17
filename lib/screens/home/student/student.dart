import 'package:GVPS/models/brew.dart';
import 'package:GVPS/screens/home/student/feesform.dart';
import 'package:GVPS/services/studentData.dart';
import 'package:flutter/material.dart';
import 'package:GVPS/shared/loading.dart';

class Student extends StatefulWidget {
  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  String notav = 'Not Avail';
  @override
  Widget build(BuildContext context) {
    String did = ModalRoute.of(context).settings.arguments;
    StudentData studentData = StudentData(did: did);
    return StreamBuilder<ClassData>(
      stream: studentData.studentsdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ClassData data = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              backgroundColor: Colors.grey[850],
              title: Text('Student Data'),
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Fees Details',
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 25.0,
                            letterSpacing: 2.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                              onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return FeesForm(
                                      did: did,
                                    );
                                  }),
                              color: Colors.grey[850],
                              child: Text(
                                'Edit Fees',
                                style: TextStyle(
                                    color: Colors.amberAccent,
                                    fontSize: 15.0,
                                    letterSpacing: 2.0),
                              )),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Total Fees:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.totalfees ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Fees Paid:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.paidfees ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Fees Remaining:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.remainingfees ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Student Details',
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 25.0,
                            letterSpacing: 2.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Name:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.name ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Aadhar No:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.aadhar.toString() ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.caste ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Class:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.classno.toString() ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Date of Birth:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.dob ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'SSMID:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.ssmid ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Family Id:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.fmid ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Father:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.father ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'Mother:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.mother ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Mobile No.:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.mobileno ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: Text(
                        'Account Details',
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 25.0,
                            letterSpacing: 2.0),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Account No:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.accountno ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
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
                          'IFSC:',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          data.ifsc ?? notav,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 2.0),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
