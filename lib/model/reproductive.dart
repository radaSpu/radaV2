class Reproductive {
  late int id;
  late String name;
  late String contraceptionintroduction;
  late String methods;
  late String condomswork;
  late String injectable;
  late String oralpill;
  late String iucds;
  late String implants;
  late String emergency;
  late String contraceptionvideo;
  late String know;
  late String boyfriend;
  late String night;
  late String casual;
  late String sponsor;
  late String dyn1;
  late String sponsorvideo;
  late String pregnancydyn;
  late String pregnancycauses;
  late String pregnancysigns;
  late String stiintroduction;
  late String pregnancytest;
  late String prenatalcare;
  late String antinetalcare;
  late String postnatal;
  late String pregnancynutrition;
  late String pregnancydanger;
  late String riskfactors;
  late String stitypes;
  late String stisigns;
  late String commonstisigns;
  late String treatment;
  late String protectiontips;
  late String facts;
  late String myths;
  late String stisharm;
  late String hivsti;
  late String created_at;

  Reproductive(
      {required this.id,
      required this.name,
      required this.contraceptionintroduction,
      required this.methods,
      required this.condomswork,
      required this.injectable,
      required this.oralpill,
      required this.iucds,
      required this.implants,
      required this.emergency,
      required this.contraceptionvideo,
      required this.know,
      required this.boyfriend,
      required this.night,
      required this.casual,
      required this.sponsor,
      required this.dyn1,
      required this.sponsorvideo,
      required this.pregnancydyn,
      required this.pregnancycauses,
      required this.pregnancysigns,
      required this.stiintroduction,
      required this.pregnancytest,
      required this.prenatalcare,
      required this.antinetalcare,
      required this.postnatal,
      required this.pregnancynutrition,
      required this.pregnancydanger,
      required this.riskfactors,
      required this.stitypes,
      required this.stisigns,
      required this.commonstisigns,
      required this.treatment,
      required this.protectiontips,
      required this.facts,
      required this.myths,
      required this.stisharm,
      required this.hivsti,
      required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'contraceptionintroduction': contraceptionintroduction,
      'methods': methods,
      'condomswork': condomswork,
      'injectable': injectable,
      'oralpill': oralpill,
      'iucds': iucds,
      'implants': implants,
      'emergency': emergency,
      'contraceptionvideo': contraceptionvideo,
      'know': know,
      'boyfriend': boyfriend,
      'night': night,
      'casual': casual,
      'sponsor': sponsor,
      'dyn1': dyn1,
      'sponsorvideo': sponsorvideo,
      'pregnancydyn': pregnancydyn,
      'pregnancycauses': pregnancycauses,
      'pregnancysigns': pregnancysigns,
      'pregnancytest': pregnancytest,
      'prenatalcare': prenatalcare,
      'postnatal': postnatal,
      'antinetalcare': antinetalcare,
      'pregnancynutrition': pregnancynutrition,
      'stiintroduction': stiintroduction,
      'pregnancydanger': pregnancydanger,
      'riskfactors': riskfactors,
      'stitypes': stitypes,
      'stisigns': stisigns,
      'commonstisigns': commonstisigns,
      'treatment': treatment,
      'protectiontips': protectiontips,
      'facts': facts,
      'myths': myths,
      'stisharm': stisharm,
      'hivsti': hivsti,
      'created_at': created_at,
    };
  }

  Reproductive.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    contraceptionintroduction = map['contraceptionintroduction'];
    methods = map['methods'];
    condomswork = map['condomswork'];
    injectable = map['injectable'];
    oralpill = map['oralpill'];
    iucds = map['iucds'];
    implants = map['implants'];
    emergency = map['emergency'];
    contraceptionvideo = map['contraceptionvideo'];

    know = map['know'];
    boyfriend = map['boyfriend'];
    night = map['night'];
    casual = map['casual'];
    sponsor = map['sponsor'];
    dyn1 = map['dyn1'];
    sponsorvideo = map['sponsorvideo'];
    pregnancydyn = map['pregnancydyn'];
    pregnancycauses = map['pregnancycauses'];
    pregnancysigns = map['pregnancysigns'];
    stiintroduction = map['stiintroduction'];

    pregnancytest = map['pregnancytest'];
    prenatalcare = map['prenatalcare'];
    postnatal = map['postnatal'];
    antinetalcare = map['antinetalcare'];
    pregnancynutrition = map['pregnancynutrition'];
    pregnancydanger = map['pregnancydanger'];
    riskfactors = map['riskfactors'];
    stitypes = map['stitypes'];
    stisigns = map['stisigns'];
    commonstisigns = map["commonstisigns"];
    treatment = map["treatment"];
    protectiontips = map['protectiontips'];
    facts = map["facts"];
    myths = map['myths'];
    stisharm = map['stisharm'];
    hivsti = map['hivsti'];

    created_at = map['created_at'].toString();
  }
}
