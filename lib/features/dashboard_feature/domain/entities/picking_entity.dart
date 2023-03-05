import 'package:equatable/equatable.dart';

class Picking extends Equatable {
  final String emplacement;
  final String article;
  final int quantite;
  final int capacite;

  const Picking(
      {required this.emplacement,
      required this.article,
      required this.quantite,
      required this.capacite});

  @override
  List<Object?> get props => [emplacement, article, quantite, capacite];
}
