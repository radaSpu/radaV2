class ForumModel {
  late int id;
  late String message;
  late String sender_id;
  late String sender_name;
  late String size;
  late String student_avata;
  late String filename;
  late String thumb;
  late String title;
  late String url;
  late String type;
  late String imagename;
  late String status;
  late String reply;
  late String caption;
  late String channel;
  late String created_at;
  late String time;

  ForumModel(
      {required this.id,
      required this.message,
      required this.sender_id,
      required this.sender_name,
      required this.size,
      required this.student_avata,
      required this.filename,
      required this.thumb,
      required this.title,
      required this.url,
      required this.type,
      required this.imagename,
      required this.status,
      required this.reply,
      required this.caption,
      required this.channel,
      required this.created_at,
      required this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'sender_id': sender_id,
      'sender_name': sender_name,
      'size': size,
      'student_avata': student_avata,
      'filename': filename,
      'thumb': thumb,
      'url': url,
      'title': title,
      'type': type,
      'imagename': imagename,
      'status': status,
      'reply': reply,
      'caption': caption,
      'channel': channel,
      'created_at': created_at,
      'time': time,
    };
  }

  ForumModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    message = map['message'];
    sender_id = map['sender_id'];
    sender_name = map['sender_name'];
    size = map['size'].toString();
    student_avata = map['student_avata'];
    filename = map['filename'];
    thumb = map['thumb'];
    url = map['url'].toString();
    title = map['title'];
    type = map['type'];
    imagename = map['imagename'];
    status = map['status'];
    reply = map['reply'];
    caption = map['caption'];
    channel = map['channel'];
    created_at = map['created_at'];
    time = map['time'];
  }
}
