

class DolphinModel{

  String photoUrl;

  DolphinModel({required this.photoUrl});


  Map<String, dynamic> toMap() => {
        'photoUrl': photoUrl,
      };

  factory DolphinModel.fromMap(Map<String, dynamic> map) {
    return DolphinModel(
      photoUrl: map['urls']['regular'] ,
    );
  }
}