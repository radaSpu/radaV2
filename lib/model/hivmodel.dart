class HivModel {
  late int id;
  late String name;
  late String kenyahiv;
  late String definition;
  late String hivsymptoms;
  late String transmissionmodes;
  late String nottransmitted;
  late String hivmyths;
  late String hivprevention;
  late String mothertochild;
  late String hivstigma;
  late String created_at;

  HivModel(
      {required this.id,
      required this.name,
      required this.kenyahiv,
      required this.definition,
      required this.hivsymptoms,
      required this.transmissionmodes,
      required this.nottransmitted,
      required this.hivmyths,
      required this.hivprevention,
      required this.mothertochild,
      required this.hivstigma,
      required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kenyahiv': kenyahiv,
      'definition': definition,
      'hivsymptoms': hivsymptoms,
      'transmissionmodes': transmissionmodes,
      'nottransmitted': nottransmitted,
      'hivmyths': hivmyths,
      'hivprevention': hivprevention,
      'mothertochild': mothertochild,
      'hivstigma': hivstigma,
      'created_at': created_at,
    };
  }

  HivModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    kenyahiv = map['kenyahiv'];
    definition = map['definition'];
    hivsymptoms = map['hivsymptoms'];
    nottransmitted = map['nottransmitted'];
    transmissionmodes = map['transmissionmodes'];
    hivmyths = map['hivmyths'];
    hivprevention = map['hivprevention'];
    mothertochild = map['mothertochild'];
    hivstigma = map['hivstigma'];
    created_at = map['created_at'].toString();
  }
}
