class MediaModel {
  String? mediaid;
  String mediaTitle;
  String mediaType;
  String mediaLink;


  MediaModel({
    this.mediaid,
    required this.mediaTitle,
    required this.mediaType,
    required this.mediaLink,
    

  });

  factory MediaModel.fromMap(Map<String, dynamic> map) {
    return MediaModel(

      mediaid: map['mediaid'],
      mediaTitle:map['mediaTitle'],
      mediaType: map['mediaType'],
      mediaLink: map['mediaLink'],

    );
  }


  Map<String,dynamic> toMap(id){
    return {
      'mediaid':id,
      'mediaTitle':mediaTitle,
      'mediaType':mediaType,
      'mediaLink':mediaLink,

    };
  }
}
