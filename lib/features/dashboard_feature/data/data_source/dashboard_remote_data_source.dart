import 'dart:convert';

import 'package:hackaton_msb/core/error/exception.dart';
import 'package:hackaton_msb/core/util/constants.dart';
import 'package:hackaton_msb/features/dashboard_feature/data/models/picking_model.dart';
import 'package:hackaton_msb/features/dashboard_feature/data/models/stock_model.dart';

import '../Interceptor/AuthInterceptor.dart';
import 'package:http/http.dart' as http;

abstract class DashboardRemoteDataSource {
  Future<List<PickingModel>> getAllPickings();
  Future<List<StockModel>> getAllStock();
}

class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final AuthenticatedHttpClient httpClient;

  DashboardRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<List<PickingModel>> getAllPickings() async {
    final url = 'https://0fc1-197-5-52-210.ngrok.io/picking';
    final response = await http.get(Uri.parse(url));
        print("pick ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["Picking"] as List;
      print("pick ${data}");

      final List<PickingModel> yourData = List<PickingModel>.from(
          data.map((json) => PickingModel.fromJson(json)));

      return yourData;
    } else {
      throw Exception('Failed to abcde fetch data');
    }
  }

  @override
  Future<List<StockModel>> getAllStock() async {
    final url = 'https://0fc1-197-5-52-210.ngrok.io/stock';
    final response = await http.get(Uri.parse(url));
    print("stock ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)["Produits"] as List;
      print("stock ${data}");
      final List<StockModel> yourData =
          List<StockModel>.from(data.map((json) => StockModel.fromJson(json)));

      return yourData;
    } else {
      throw Exception('Failed to abcde fetch data');
    }
  }

/*
  @override
  Future<List<PickingModel>> getAllPickings() async {
    final response = await httpClient.get(Uri.parse("${BASE_URL}picking"));
    print("zaaaaaaaaaab ${response.body}");
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body)["Produits"] as List;
      final List<PickingModel> pickingModels = decodedJson
          .map<PickingModel>(
              (pickingModel) => PickingModel.fromJson(pickingModel))
          .toList();
      return pickingModels;
    } else {
      throw ServerException(message: "An unpexteced error occured");
    }
  }*/
}
