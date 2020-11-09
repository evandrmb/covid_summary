import 'dart:convert';

import 'package:covid_summary/data/datasources/fetch_global_summary_datasource.dart';
import 'package:covid_summary/data/models/global_summary_model.dart';
import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:covid_summary/domain/errors/covid_summary_errors.dart';
import 'package:covid_summary/domain/repositories/fetch_global_summary_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class FetchGlobalSummaryRepositoryImpl implements FetchGlobalSummaryRepository {
  final FetchGlobalSummaryDatasource _dataSource;

  FetchGlobalSummaryRepositoryImpl(this._dataSource);

  @override
  Future<Either<CovidSummaryErrors, GlobalSummary>> fetch() async {
    try {
      final response = await _dataSource.fetch();

      if (response.statusCode == 200) {
        return Right(GlobalSummaryModel.fromMap(response.data));
      } else {
        throw UnknowError();
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.CONNECT_TIMEOUT:
          return Left(TimeoutError());
          break;
        default:
          return Left(UnknowError(message: e.toString()));
      }
    } catch (e) {
      return Left(UnknowError(message: e.toString()));
    }
  }
}
