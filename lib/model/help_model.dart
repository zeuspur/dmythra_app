class HelpModel {
  String? helpid;
  String helpType;
  int helpNumber;
  String userid;
  bool isAccepted;


  HelpModel({
    this.helpid,
    required this.helpType,
    required this.helpNumber,
    required this.userid,
    required this.isAccepted

  });

  factory HelpModel.fromMap(Map<String, dynamic> map) {
    return HelpModel(
      helpid: map['helpid'],
      helpType: map['helpType'],
      helpNumber: map['helpNumber'],
      userid:map['userid'],
      isAccepted:map['isAccepted'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'helpid':id,
      'helpType':helpType,
      'helpNumber':helpNumber,
      'userid':userid,
      'isAccepted':isAccepted,

    };
  }
}
