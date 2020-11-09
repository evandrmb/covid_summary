import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:flutter/foundation.dart';

class GlobalSummaryModel extends GlobalSummary {
  GlobalSummaryModel(
      {@required int newConfirmed,
      @required int totalConfirmed,
      @required int newDeaths,
      @required int totalDeaths,
      @required int newRecovered,
      @required int totalRecovered})
      : super(newConfirmed, totalConfirmed, newDeaths, totalDeaths,
            newRecovered, totalRecovered);

  factory GlobalSummaryModel.fromMap(Map<String, dynamic> json) =>
      GlobalSummaryModel(
        newConfirmed: json['Global']["NewConfirmed"],
        totalConfirmed: json['Global']["TotalConfirmed"],
        newDeaths: json['Global']["NewDeaths"],
        totalDeaths: json['Global']["TotalDeaths"],
        newRecovered: json['Global']["NewRecovered"],
        totalRecovered: json['Global']["TotalRecovered"],
      );
}
