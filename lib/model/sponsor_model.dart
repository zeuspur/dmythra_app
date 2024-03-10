class SponsorModel {
  String sponsorid;
  String sponsorname;
  String dob;
  String  email;
  int aadhar;
  int phone;

  SponsorModel({
    required this.sponsorid,
    required this.sponsorname,
    required this.dob,
    required this.email,
    required this.aadhar,
    required this.phone,
  });

  factory SponsorModel.fromMap(Map<String, dynamic> map) {
    return SponsorModel(
      sponsorid: map['sponsorid'],
      sponsorname: map['sponsorname'],
      dob: map['dob'],
      email: map['email'],
      aadhar: map['aadhar'],
      phone: map['phone'],
    );
  }


  Map<String,dynamic> toMap(){
    return {
      'sponsorid':sponsorid,
      'sponsorname':sponsorname,
      'dob':dob,
      'email':email,
      'aadhar':aadhar,
      'phone' :phone,
    };
  }
}
