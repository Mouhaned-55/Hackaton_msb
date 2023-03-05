import 'package:equatable/equatable.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class LoadingState extends DashboardState {}

class LoadedPickingState extends DashboardState {
  final List<Picking> picking;

  const LoadedPickingState({
    required this.picking,
  });

  @override
  List<Object> get props => [picking];
}

class LoadedStockState extends DashboardState {
  final List<Stock> stock;

  const LoadedStockState({required this.stock});

  @override
  List<Object> get props => [stock];
}

class ErrorDashboardState extends DashboardState {
  final String message;

  const ErrorDashboardState({required this.message});

  @override
  List<Object> get props => [message];
}
