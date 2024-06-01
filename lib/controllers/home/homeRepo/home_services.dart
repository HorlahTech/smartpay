import 'package:smartpay/models/dashboard/dashboardResponse.dart';

abstract class DashoardService {
  Future<DashboardResponse> dashboard();
}
