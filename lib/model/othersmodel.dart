class OthersModel {
  late int id;
  late String name;
  late String introduction;
  late String seventips;
  late String savingmoney;
  late String takeaction;
  late String moneysavingtips;
  late String earnextracoin;
  late String gratuationjob;
  late String careerresourses;
  late String internships;
  late String cvletter;
  late String professionaljobs;
  late String alumni;
  late String recentgratuates;
  late String createopportunities;

  late String created_at;

  OthersModel({

    required this.id,
    required this.name,
    required this.introduction,
    required this.seventips,
    required this.savingmoney,
    required this.takeaction,
    required this.moneysavingtips,
    required this.earnextracoin,
    required this.gratuationjob,
    required this.careerresourses,
    required this.internships,
    required this.cvletter,
    required this.professionaljobs,
    required this.alumni,
    required this.recentgratuates,
    required this.createopportunities,
    required this.created_at
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'introduction':introduction,
      'seventips':seventips,
      'savingmoney':savingmoney,
      'takeaction':takeaction,
      'moneysavingtips':moneysavingtips,
      'earnextracoin':earnextracoin,
      'gratuationjob':gratuationjob,
      'careerresourses':careerresourses,
      'internships':internships,
      'cvletter':cvletter,
      'professionaljobs':professionaljobs,
      'alumni':alumni,

      'recentgratuates':recentgratuates,
      'createopportunities':createopportunities,


      'created_at': created_at,
    };
  }


  OthersModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    introduction=map['introduction'];
    seventips=map['seventips'];
    savingmoney=map['savingmoney'];
    takeaction=map['takeaction'];
    moneysavingtips=map['moneysavingtips'];
    earnextracoin=map['earnextracoin'];
    gratuationjob=map['gratuationjob'];
    careerresourses=map['careerresourses'];
    internships=map['internships'];
    cvletter=map['cvletter'];
    professionaljobs=map['professionaljobs'];
    alumni=map['alumni'];

    recentgratuates=map['recentgratuates'];
    createopportunities=map['createopportunities'];

    created_at = map['created_at'].toString();
  }

}