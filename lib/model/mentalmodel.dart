class MentalModel {
  late int id;
  late String name;
  late String mentaldef;
  late String mentalilldef;
  late String riskfactors;
  late String disorders;
  late String suicideprevention;
  late String suicidehelp;
  late String suicidevideo;
  late String eatingdisordersinto;
  late String anorexia;
  late String bulimia;
  late String biengeeating;
  late String eatinghelp;
  late String mentalhelpintro;
  late String psychotherapy;
  late String medication;
  late String selfhelp;
  late String created_at;

  MentalModel(
      {required this.id,
      required this.name,
      required this.mentaldef,
      required this.mentalilldef,
      required this.riskfactors,
      required this.disorders,
      required this.suicideprevention,
      required this.suicidehelp,
      required this.suicidevideo,
      required this.eatingdisordersinto,
      required this.anorexia,
      required this.bulimia,
      required this.biengeeating,
      required this.eatinghelp,
      required this.mentalhelpintro,
      required this.psychotherapy,
      required this.medication,
      required this.selfhelp,
      required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mentaldef': mentaldef,
      'mentalilldef': mentalilldef,
      'riskfactors': riskfactors,
      'disorders': disorders,
      'suicideprevention': suicideprevention,
      'suicidehelp': suicidehelp,
      'suicidevideo': suicidevideo,
      'eatingdisordersinto': eatingdisordersinto,
      'anorexia': anorexia,
      'bulimia': bulimia,
      'biengeeating': biengeeating,
      'eatinghelp': eatinghelp,
      'mentalhelpintro': mentalhelpintro,
      'psychotherapy': psychotherapy,
      'medication': medication,
      'selfhelp': selfhelp,
      'created_at': created_at,
    };
  }

  MentalModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    mentaldef = map['mentaldef'];
    mentalilldef = map['mentalilldef'];
    riskfactors = map['riskfactors'];
    disorders = map['disorders'];
    suicideprevention = map['suicideprevention'];
    suicidehelp = map['suicidehelp'];
    suicidevideo = map['suicidevideo'];
    eatingdisordersinto = map['eatingdisordersinto'];
    anorexia = map['anorexia'];
    bulimia = map['bulimia'];
    biengeeating = map['biengeeating'];
    eatinghelp = map['eatinghelp'];
    mentalhelpintro = map['mentalhelpintro'];
    psychotherapy = map['psychotherapy'];
    medication = map['medication'];
    selfhelp = map['selfhelp'];
    created_at = map['created_at'].toString();
  }
}
