import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/usecases/get_all_pickings.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/usecases/get_all_stock.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/Interceptor/AuthInterceptor.dart';
import 'dashboard_events.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetAllPickingsUseCase getAllPickingsUseCase;
  final GetAllStockUseCase getAllStockUseCase;
  final AuthenticatedHttpClient httpClient;

  DashboardBloc(
      {required this.getAllPickingsUseCase,
      required this.getAllStockUseCase,
      required this.httpClient})
      : super(DashboardInitial()) {
    on<DashboardEvent>((event, emit) async {
      if (event is GetAllPickingsEvent) {
        emit(LoadingState());
        final failureOrPicking = await getAllPickingsUseCase();
        final failureOrStock = await getAllStockUseCase();
        failureOrPicking.fold(
            (failure) => emit(ErrorDashboardState(message: "An error occured")),
            (pickings) {
          print("taraji $pickings");
          emit(LoadedPickingState(picking: pickings));
        });
        failureOrStock.fold(
            (failure) => emit(ErrorDashboardState(message: "An error occured")),
            (stock) {
          print("taraji $stock");
          emit(LoadedStockState(stock: stock));
        });
      }
    });
  }
}
