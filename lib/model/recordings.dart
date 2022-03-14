class Recordings {
  late int id;
  late String name;
  late String url;
  late String duration;
  late String date;
  late String time;
  late String type;
  late String created_at;

  Recordings(
      {required this.id,
      required this.name,
      required this.url,
      required this.duration,
      required this.date,
      required this.time,
      required this.type,
      required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'duration': duration,
      'created_at': created_at,
    };
  }

  /*Recordings.fromMap(Map<late String, dynamic> map, required this.id, required this.name, required this.url, required this.created_at) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    created_at = map['created_at'];
  }*/

  Recordings.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    url = map['url'];
    duration = map['duration'];
    created_at = map['created_at'].toString();
  }
}
