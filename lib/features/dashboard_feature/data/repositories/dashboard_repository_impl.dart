import 'package:hackaton_msb/core/error/exception.dart';
import 'package:hackaton_msb/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:hackaton_msb/core/network/network_info.dart';
import 'package:hackaton_msb/features/dashboard_feature/data/data_source/dashboard_remote_data_source.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/picking_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/entities/stock_entity.dart';
import 'package:hackaton_msb/features/dashboard_feature/domain/repositories/dashboard_repository.dart';

class DashBoardRepositoryImpl implements DashBoardRepository {
  final DashboardRemoteDataSource dashboardRemoteDataSource;
  final NetworkInfo networkInfo;

  DashBoardRepositoryImpl(
      {required this.dashboardRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<Picking>>> getPickings() async {
    if (await networkInfo.isConnected) {
      try {
        final remotePickings = await dashboardRemoteDataSource.getAllPickings();
        return Right(remotePickings);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "An unexpected error occured"));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<Stock>>> getStocks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteStocks = await dashboardRemoteDataSource.getAllStock();
        return Right(remoteStocks);
      } on ServerException catch (e) {
        return Left(ServerFailure(message: "An unexpected error occured"));
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
