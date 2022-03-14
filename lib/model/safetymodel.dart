class SafetyModel {
  late int id;
  late String name;
  late String safedating;
  late String datingrules;
  late String formen;
  late String forladies;
  late String datingtips;
  late String gbv;
  late String cybercrimes;
  late String safetytips;
  late String gbvintro;
  late String prominentplaces;
  late String protectyourself;
  late String gbveffects;
  late String gettinghelp;
  late String campussafety;
  late String campussafetytips;
  late String cybercrimesintro;
  late String cybercrimestips;
  late String cybercrimestypes;
  late String cyberlaws;
  late String socialmediabenefits;
  late String socialmediapitfalls;
  late String socialmediarules;
  late String socialmediasafety;
  late String created_at;

  SafetyModel({required this.id, required this.name,required this.safedating,
    required this.datingrules,required this.formen,required this.forladies,required this.datingtips,required this.gbv,
    required this.cybercrimes,required this.safetytips,required this.gbvintro,required this.prominentplaces,required this.protectyourself,required this.gbveffects,required this.gettinghelp,
    required this.campussafety,
    required this.campussafetytips,
    required this.cybercrimesintro,
    required this.cybercrimestips,
    required this.cyberlaws,
    required this.cybercrimestypes,
    required this.socialmediasafety,
    required this.socialmediarules,
    required this.socialmediapitfalls,
    required this.socialmediabenefits,
    required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'safedating':safedating,
      'datingrules':datingrules,
      'formen':formen,
      'forladies':forladies,
      'safetytips':safetytips,
      'gbvintro':gbvintro,
      'prominentplaces':prominentplaces,
      'protectyourself':protectyourself,
      'gbveffects':gbveffects,
      'gettinghelp':gettinghelp,
      'campussafety':campussafety,
      'campussafetytips':campussafetytips,
      'cybercrimesintro':cybercrimesintro,
      'cybercrimestips':cybercrimestips,
      'cyberlaws':cyberlaws,
      'cybercrimestypes':cybercrimestypes,
      'socialmediasafety':socialmediasafety,
      'socialmediarules':socialmediarules,
      'socialmediapitfalls':socialmediapitfalls,
      'socialmediabenefits':socialmediabenefits,

      'created_at': created_at,
    };
  }


  SafetyModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    safedating=map['safedating'];
    datingrules=map['datingrules'];
    formen=map['formen'];
    forladies=map['forladies'];
    //datingtips=map['datingtips'];
    gbv=map['gbv'];
    cybercrimesintro=map['cybercrimesintro'];
    cybercrimestips=map['cybercrimestips'];
    cyberlaws=map['cyberlaws'];
    cybercrimestypes=map['cybercrimestypes'];
    socialmediasafety=map['socialmediasafety'];

    socialmediarules=map['socialmediarules'];
    socialmediapitfalls=map['socialmediapitfalls'];
    socialmediabenefits=map['socialmediabenefits'];
    safetytips=map['safetytips'];
    gbvintro=map['gbvintro'];
    prominentplaces=map['prominentplaces'];
    protectyourself=map['protectyourself'];
    gbveffects=map['gbveffects'];
    gettinghelp=map['gettinghelp'];
    campussafety=map['campussafety'];
    campussafetytips=map["campussafetytips"];
    created_at = map['created_at'].toString();
  }

}