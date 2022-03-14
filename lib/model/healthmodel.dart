class HealthModel {
  late int id;
  late String name;
  late String noncommunicableintro;
  late String keyriskfactors;
  late String poorlifestyles;
  late String healthylifestyles;
  late String weightobesity;
  late String weightmanagement;
  late String weightmanagementrecons;
  late String weightmanagementhelp;
  late String nutritionintro;
  late String foodproduction;
  late String foodconsumption;
  late String nutrientutilization;
  late String posthavest;
  late String physicalinactivity;
  late String nutrientsources;
  late String nutritionandpregnancy;
  late String nutritionandhiv;
  late String hygieneintro;
  late String hygieneimportance;
  late String goodhabits;
  late String emergencyplanning;
  late String selfmaintainace;
  late String offensivehabits;
  late String support;
  late String remember;
  late String physicalintro;
  late String benefits;

  late String created_at;

  HealthModel({

    required this.id,
    required this.name,
    required this.noncommunicableintro,
    required this.keyriskfactors,
    required this.poorlifestyles,
    required this.healthylifestyles,
    required this.weightobesity,
    required this.weightmanagement,
    required this.weightmanagementrecons,
    required this.weightmanagementhelp,
    required this.nutritionintro,
    required this.foodproduction,
    required this.foodconsumption,
    required this.nutrientutilization,
    required this.posthavest,
    required this.physicalinactivity,
    required this.nutrientsources,
    required this.nutritionandpregnancy,
    required this.nutritionandhiv,

    required this.hygieneintro,
    required this.hygieneimportance,
    required this.goodhabits,
    required this.emergencyplanning,
    required this.selfmaintainace,
    required this.offensivehabits,
    required this.support,
    required this.remember,

    required this.physicalintro,
    required this.benefits,

    required this.created_at
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'noncommunicableintro':noncommunicableintro,
      'keyriskfactors':keyriskfactors,
      'poorlifestyles':poorlifestyles,
      'healthylifestyles':healthylifestyles,
      'weightobesity':weightobesity,
      'weightmanagement':weightmanagement,
      'weightmanagementrecons':weightmanagementrecons,
      'weightmanagementhelp':weightmanagementhelp,
      'nutritionintro':nutritionintro,
      'foodproduction':foodproduction,
      'foodconsumption':foodconsumption,
      'nutrientutilization':nutrientutilization,
      'posthavest':posthavest,
      'physicalinactivity':physicalinactivity,
      'nutrientsources':nutrientsources,
      'nutritionandpregnancy':nutritionandpregnancy,
      'nutritionandhiv':nutritionandhiv,

      'hygieneintro':hygieneintro,
      'hygieneimportance':hygieneimportance,
      'goodhabits':goodhabits,
      'emergencyplanning':emergencyplanning,
      'selfmaintainace':selfmaintainace,
      'offensivehabits':offensivehabits,
      'support':support,
      'remember':remember,

      'physicalintro':physicalintro,
      'benefits':benefits,


      'created_at': created_at,
    };
  }


  HealthModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    noncommunicableintro=map['noncommunicableintro'];
    keyriskfactors=map['keyriskfactors'];
    poorlifestyles=map['poorlifestyles'];
    healthylifestyles=map['healthylifestyles'];
    weightobesity=map['weightobesity'];
    weightmanagement=map['weightmanagement'];
    weightmanagementrecons=map['weightmanagementrecons'];
    weightmanagementhelp=map['weightmanagementhelp'];
    nutritionintro=map['nutritionintro'];
    foodproduction=map['foodproduction'];
    foodconsumption=map['foodconsumption'];
    nutrientutilization=map['nutrientutilization'];
    posthavest=map['posthavest'];
    physicalinactivity=map['physicalinactivity'];
    nutrientsources=map['nutrientsources'];
    nutritionandpregnancy=map['nutritionandpregnancy'];
    nutritionandhiv=map['nutritionandhiv'];

    hygieneintro=map['hygieneintro'];
    hygieneimportance=map['hygieneimportance'];
    goodhabits=map['goodhabits'];
    emergencyplanning=map['emergencyplanning'];
    selfmaintainace=map['selfmaintainace'];
    offensivehabits=map['offensivehabits'];
    support=map['support'];
    remember=map['remember'];
    physicalintro=map['physicalintro'];
    benefits=map['benefits'];

    created_at = map['created_at'].toString();
  }

}