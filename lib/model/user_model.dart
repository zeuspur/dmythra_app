class UserModel {
  String userid;
  String udid;
  String username;
  String disability;
  String dob;
  String email;
  int aadhar;
  int phone;

  UserModel({
    required this.userid,
    required this.udid,
    required this.username,
    required this.disability,
    required this.dob,
    required this.email,
    required this.aadhar,
    required this.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userid: map['userid'],
      udid: map['udid'],
      username: map['username'],
      disability: map['disability'],
      dob: map['dob'],
      email: map['email'],
      aadhar: map['aadhar'],
      phone: map['phone'],
    );
  }


  Map<String,dynamic> toMap(){
    return {
      'userid':userid,
      'udid':udid,
      'username':username,
      'disability':disability,
      'dob':dob,
      'email':email,
      'aadhar':aadhar,
      'phone':phone,
    };
  }
}
