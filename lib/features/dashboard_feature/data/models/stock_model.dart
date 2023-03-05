import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';

class StockModel extends Stock {
  const StockModel(
      {required super.emplacement,
      required super.article,
      required super.lot,
      required super.sous_lot,
      required super.us,
      required super.quantite});

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
        emplacement: json["Emplacement"],
        article: json["Article"],
        lot: json["Lot"],
        sous_lot: json["Sous_lot"],
        us: json["US"],
        quantite: json["Quantite"]);
  }
}


/*

"Emplacement": "M2R01A02",
"Article": "PF031",
"Lot": "JPF03123002",
"Sous_lot": "001",
"US": "UN",
"Quantite": 5999
 */