import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/repositories/dashboard_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class GetAllStockUseCase {
  final DashBoardRepository dashBoardRepository;

  GetAllStockUseCase(this.dashBoardRepository);

  Future<Either<Failure, List<Stock>>> call() async {
    return await dashBoardRepository.getStocks();
  }
}
