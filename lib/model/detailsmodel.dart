class DetailsModel {
  late int id;
  late String name;
  late String user_id;
  late String user_type;
  late String synced;
  late String created_at;

  DetailsModel({required this.id, required this.user_id,required this.user_type,
    required this.synced,
    required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user_id':user_id,
      'user_type':user_type,
      'synced':synced,
      'created_at': created_at,
    };
  }


  DetailsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    user_id=map['user_id'];
    user_type = map['user_type'];
    synced=map['synced'];
    created_at = map['created_at'].toString();
  }

}