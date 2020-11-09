import 'package:covid_summary/data/datasources/fetch_global_summary_datasource.dart';
import 'package:covid_summary/data/repositories/fetch_global_summary_repository_impl.dart';
import 'package:covid_summary/domain/repositories/fetch_global_summary_repository.dart';
import 'package:covid_summary/domain/usecases/fetch_global_summary.dart';
import 'package:covid_summary/external/datasources/fetch_global_summary_datasource_impl.dart';
import 'package:covid_summary/presenter/home_controller.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class CovidSummaryBinding {
  void dependencies() {
    Get.put(Dio(BaseOptions(baseUrl: 'https://api.covid19api.com/')));

    Get.put<FetchGlobalSummaryDatasource>(
        FetchGlobalSummaryDatasourceImpl(Get.find<Dio>()));

    Get.put<FetchGlobalSummaryRepository>(FetchGlobalSummaryRepositoryImpl(
        Get.find<FetchGlobalSummaryDatasource>()));

    Get.put(FetchGlobalSummary(Get.find<FetchGlobalSummaryRepository>()));

    Get.put(HomeController(Get.find<FetchGlobalSummary>()));
  }
}
