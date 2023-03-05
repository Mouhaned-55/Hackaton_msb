import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';

class PickingModel extends Picking {
  const PickingModel({
    required super.emplacement,
    required super.article,
    required super.quantite,
    required super.capacite,
  });

  factory PickingModel.fromJson(Map<String, dynamic> json) {
    return PickingModel(
        emplacement: json["Emplacement"],
        article: json["Article"],
        quantite: json["Quantite"],
        capacite: json["Capacite"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'emplacement': emplacement,
      'article': article,
      'article': article,
      'article': article,
    };
  }
}
