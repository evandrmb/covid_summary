import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:covid_summary/domain/errors/covid_summary_errors.dart';
import 'package:dartz/dartz.dart';

abstract class FetchGlobalSummaryRepository {
  Future<Either<CovidSummaryErrors, GlobalSummary>> fetch();
}
