class PostModel {
  String? postid;
  String postPic;
  String postBio;
  String userid;
  String username;


  PostModel({
     this.postid,
    required this.postPic,
    required this.postBio,
    required this.userid,
    required this.username,

  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      postid: map['postid'],
      postPic: map['postPic'],
      postBio: map['postBio'],
      userid:map['userid'],
      username:map['username'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'postid':id,
      'postPic':postPic,
      'postBio':postBio,
      'userid':userid,
      'username':username,

    };
  }
}
