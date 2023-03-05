import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';

import '../../../../core/error/failures.dart';

abstract class DashBoardRepository {
  Future<Either<Failure, List<Picking>>> getPickings();
  Future<Either<Failure, List<Stock>>> getStocks();

}
