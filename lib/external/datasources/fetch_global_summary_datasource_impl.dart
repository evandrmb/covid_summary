import 'package:covid_summary/data/datasources/fetch_global_summary_datasource.dart';
import 'package:dio/dio.dart';

class FetchGlobalSummaryDatasourceImpl implements FetchGlobalSummaryDatasource {
  final Dio dio;

  FetchGlobalSummaryDatasourceImpl(this.dio);
  @override
  Future<Response> fetch() async {
    return await dio.get('summary');
  }
}
