class DrugsModel {
  late int id;
  late String name;
  late String alcoholintroduction;
  late String alcoholismsigns;
  late String associatedhealthissues;
  late String alcoholismtreatment;
  late String alcoholismhelp;
  late String alcoholhelpcontacts;
  late String alcoholvideo;
  late String heroineintro;
  late String heroineeffects;
  late String heroineinjection;
  late String heroinerecovery;
  late String heroinefurtherhelp;
  late String weedintro;
  late String weedmyths;
  late String weedfacts;
  late String quitweed;
  late String weednote;
  late String weedfaq;
  late String weedhelp;
  late String weeddyn;
  late String created_at;

  DrugsModel(
      {required this.id,
      required this.name,
      required this.alcoholintroduction,
      required this.alcoholismsigns,
      required this.associatedhealthissues,
      required this.alcoholismtreatment,
      required this.alcoholismhelp,
      required this.alcoholhelpcontacts,
      required this.alcoholvideo,
      required this.heroineintro,
      required this.heroineeffects,
      required this.weedmyths,
      required this.weedfacts,
      required this.quitweed,
      required this.weednote,
      required this.weedintro,
      required this.weedfaq,
      required this.weedhelp,
      required this.heroineinjection,
      required this.heroinerecovery,
      required this.heroinefurtherhelp,
      required this.weeddyn,
      required this.created_at});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'alcoholintroduction': alcoholintroduction,
      'alcoholismsigns': alcoholismsigns,
      'associatedhealthissues': associatedhealthissues,
      'alcoholismtreatment': alcoholismtreatment,
      'alcoholismhelp': alcoholismhelp,
      'alcoholhelpcontacts': alcoholhelpcontacts,
      'alcoholvideo': alcoholvideo,
      'heroineintro': heroineintro,
      'heroineeffects': heroineeffects,
      'heroineinjection': heroineinjection,
      'heroinerecovery': heroinerecovery,
      'heroinefurtherhelp': heroinefurtherhelp,
      'weedintro': weedintro,
      'weedmyths': weedmyths,
      'weedfacts': weedfacts,
      'quitweed': quitweed,
      'weednote': weednote,
      'weedfaq': weedfaq,
      'weedhelp': weedhelp,
      'weeddyn': weeddyn,
      'created_at': created_at,
    };
  }

  DrugsModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    alcoholintroduction = map['alcoholintroduction'];
    alcoholismsigns = map['alcoholismsigns'];
    associatedhealthissues = map['associatedhealthissues'];
    alcoholismtreatment = map['alcoholismtreatment'];
    alcoholismhelp = map['alcoholismhelp'];
    alcoholhelpcontacts = map['alcoholhelpcontacts'];
    alcoholvideo = map['alcoholvideo'];
    heroineintro = map['heroineintro'];
    heroineeffects = map['heroineeffects'];
    heroineinjection = map['heroineinjection'];
    heroinerecovery = map['heroinerecovery'];
    heroinefurtherhelp = map['heroinefurtherhelp'];
    weedintro = map['weedintro'];
    weedmyths = map['weedmyths'];
    weedfacts = map['weedfacts'];
    quitweed = map['quitweed'];
    weednote = map['weednote'];
    weedfaq = map['weedfaq'];
    weedhelp = map['weedhelp'];
    weeddyn = map['weeddyn'];
    created_at = map['created_at'].toString();
  }
}
