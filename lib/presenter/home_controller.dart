import 'package:covid_summary/domain/entities/global_summary.dart';
import 'package:covid_summary/domain/usecases/fetch_global_summary.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController with StateMixin<GlobalSummary> {
  final FetchGlobalSummary useCase;

  HomeController(this.useCase);

  @override
  void onInit() {
    super.onInit();
    fetchGlobalSummary();
  }

  void fetchGlobalSummary() async {
    final result = await useCase();

    result.fold(
      (l) {
        change(null, status: RxStatus.error());
        showErrorMessage(l.message);
      },
      (r) => change(r, status: RxStatus.success()),
    );
  }

  void showErrorMessage(String error) => Get.showSnackbar(GetBar(
        duration: Duration(seconds: 5),
        borderRadius: 8,
        snackPosition: SnackPosition.TOP,
        maxWidth: Get.mediaQuery.size.width - 16,
        message: error,
      ));
}
