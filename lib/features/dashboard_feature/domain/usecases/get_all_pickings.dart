import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/picking_entity.dart';
import '../repositories/dashboard_repository.dart';

class GetAllPickingsUseCase {
  final DashBoardRepository dashBoardRepository;

  GetAllPickingsUseCase(this.dashBoardRepository);

  Future<Either<Failure, List<Picking>>> call() async {
      return await dashBoardRepository.getPickings();
  }
}
