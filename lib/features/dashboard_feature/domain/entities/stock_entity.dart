import 'package:equatable/equatable.dart';

class Stock extends Equatable {
  final String emplacement;
  final String article;
  final String lot;
  final String sous_lot;
  final String us;
  final int quantite;

  const Stock(
      {required this.emplacement,
      required this.article,
      required this.lot,
      required this.sous_lot,
      required this.us,
      required this.quantite});

  @override
  List<Object?> get props =>
      [emplacement, article, lot, sous_lot, us, quantite];
}



/*
"Emplacement": "M2R01A02",
"Article": "PF031",
"Lot": "JPF03123002",
"Sous_lot": "001",
"US": "UN",
"Quantite": 5999*/