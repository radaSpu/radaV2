class Messages {
  late int id;
  late String name;
  late String message;
  late String sender;
  late String date;
  late String time;
  late String avata;
  late String type;
  late String url;
  late String reply;
  late String mentor;
  late String created_at;

  Messages({required this.id, required this.name,required this.message,required this.sender,required this.date,required this.time,required this.avata,required this.type,required this.url,required this.reply,required this.mentor,required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'message':message,
      'sender':sender,
      'date':date,
      'time':time,
      'avata':avata,
      'type':type,
      'url':url,
      'reply':reply,
      'mentor':mentor,
      'created_at': created_at,
    };
  }


  Messages.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    message=map['message'];
    sender=map['sender'];
    date=map['date'];
    time=map['time'];
    avata=map['avata'];
    type=map['type'];
    url=map['url'];
    reply=map['reply'];
    mentor=map['mentor'];
    created_at = map['created_at'].toString();
  }

}