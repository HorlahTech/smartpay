import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartpay/controllers/home/homeRepo/home_implementation.dart';
import 'package:smartpay/controllers/home/homeRepo/home_services.dart';
import 'package:smartpay/controllers/home/home_controller/home_state.dart';
import 'package:smartpay/routes/app_routes.dart';
import 'package:smartpay/utils/secure_storage.dart';
import 'package:smartpay/widgets_utils/dialog_utils.dart';

final homeController = StateNotifierProvider<HomeController, HomeState>(
    (ref) => HomeController(DashboardImpl()));

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._dashoardService) : super(HomeState());
  final DashoardService _dashoardService;
  Future<void> getSecreteMsg() async {
    try {
      DialogUtils.showLoadingBar();

      final res = await _dashoardService.dashboard();
      AppRoute.navKey.currentState?.pop();
      state = state.copyWith(secretMessage: res.data?.secret);
    } catch (e) {
      AppRoute.navKey.currentState?.pop();
      DialogUtils.showDialogNotification(message: e.toString());
      rethrow;
    }
  }
}
