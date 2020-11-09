import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:covid_summary/presenter/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid Global Summary'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: controller.obx(
          (state) => table(state),
          onError: RaisedButton(
            onPressed: controller.fetchGlobalSummary,
            child: Text('Try again'),
          ),
          onLoading: Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  Widget table(GlobalSummary summary) => DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Label',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Data',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('New Confirmed')),
              DataCell(Text('${summary.newConfirmed}')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('New Deaths')),
              DataCell(Text('${summary.newDeaths}')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('New Recovered')),
              DataCell(Text('${summary.newRecovered}')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Total Confirmed')),
              DataCell(Text('${summary.totalConfirmed}')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Total Deaths')),
              DataCell(Text('${summary.totalDeaths}')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Total Recovered')),
              DataCell(Text('${summary.totalRecovered}')),
            ],
          ),
        ],
      );
}
