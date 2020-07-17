class Brew {
  final String name;

  Brew({this.name});
}

class ClassData {
  final String accountno,
      caste,
      dob,
      father,
      mother,
      fmid,
      ifsc,
      name,
      ssmid,
      did,
      totalfees,
      remainingfees,
      paidfees;
  final int aadhar, classno, mobileno;
  ClassData(
      {this.aadhar,
      this.accountno,
      this.caste,
      this.classno,
      this.did,
      this.dob,
      this.father,
      this.fmid,
      this.ifsc,
      this.mother,
      this.name,
      this.ssmid,
      this.paidfees,
      this.remainingfees,
      this.totalfees,
      this.mobileno});
}
