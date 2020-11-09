import 'package:dio/dio.dart';

abstract class FetchGlobalSummaryDatasource {
  Future<Response> fetch();
}
