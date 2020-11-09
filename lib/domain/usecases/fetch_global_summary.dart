import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:covid_summary/domain/errors/covid_summary_errors.dart';
import 'package:covid_summary/domain/repositories/fetch_global_summary_repository.dart';
import 'package:dartz/dartz.dart';

class FetchGlobalSummary {
  final FetchGlobalSummaryRepository _repository;

  FetchGlobalSummary(this._repository);

  Future<Either<CovidSummaryErrors, GlobalSummary>> call() async {
    return await _repository.fetch();
  }
}
